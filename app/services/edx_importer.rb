class EdxImporter
  include HTTParty
  base_uri 'https://api.edx.org/'

  def initialize
    @token = nil
  end

  def self.call
    new.get_data
  end

  def get_data
    @token = get_access_token
    get_results(@token["access_token"])
    # @data = data["results"]
  end

  private

  def get_access_token
    url = "/oauth2/v1/access_token"
    options = {
      body: {
        grant_type: "client_credentials",
        client_id: ENV['EDX_API_CLIENT_ID'],
        client_secret: ENV['EDX_API_SECRET_KEY'],
        token_type: "jwt"
      }
    }
    self.class.post(url, options)
  end

  def get_results(token)
    # URL FOR TESTING (20 results)
    test_url = "/catalog/v1/catalogs/284/courses/"
    # NUMBER OF COURSES TO RETRIEVE:

    number_of_courses = 1320 # 1319

    # STARTING POINT IN CATALOGUE
    starting_point = 0
    # URL FOR DEV AND PROD (ARBITRARY NUMBER OF COURSES)
    url = "https://prod-edx-discovery.edx.org/api/v1/catalogs/284/courses/?limit=#{number_of_courses}&offset=#{starting_point}"
    # header
    options = {:headers => {'Authorization' => 'JWT ' + token }}
    input = self.class.get(url, options)

    input["results"].each do |course|
      if Course.where(platform: "edx", platform_id: course["uuid"]).size != 0
        next
      else
        instance_attributes = {}
        instance_attributes[:platform_id] = course["uuid"]
        instance_attributes[:platform] = "edx"
        instance_attributes[:title] = course["title"]
        instance_attributes[:subtitle] = nil
        instance_attributes[:description] = get_description(course)
        instance_attributes[:categories] = get_category_main(course)
        instance_attributes[:price] = get_price(course)
        instance_attributes[:price_unit] = "€"
        instance_attributes[:image] = get_image(course)
        instance_attributes[:organization] = get_organization(course)
        instance_attributes[:url] = get_url(course)
        instance_attributes[:active] = get_status(course)
        instance_attributes[:language] = get_language(course)
        instance_attributes[:instructor] = get_instructor(course)
        instance_attributes[:duration] = get_duration(course)
        instance_attributes[:duration_unit] = nil
        instance_attributes[:knowledge_level] = get_knowledge_level(course)
        instance_attributes[:completion_time] = get_completion_time(course)
        instance_attributes[:university_course] = true

        if validator(instance_attributes)
          instance_attributes[:categories] = get_categories(course)
          new_course = Course.new(instance_attributes)
          new_course.save!
        end
      end
    end
  end

  # HELPER METHODS

  def validator(course_attributes)

    if !category_validation(course_attributes[:categories])
      return false
    # course language has to be English
    elsif course_attributes[:language] != "english"
      return false
    elsif course_attributes[:active] == nil
      return false
    else
      return true
    end
  end

  def category_validation(json)
    return false if json == "{}"

    input_hash = JSON.parse(json)
    course_categories = input_hash["categories"]
    valid_categories = ["Computer Science"]

    valid_categories.each do |category|
      return false unless course_categories.include?(category)
    end
    # valid_categories.each { |category| course_categories.include?(category) ? true : next}
  end

    # as jsonb
  def get_categories(course)
    title = course["title"]
    description = get_description(course)
    joined_string = title + description
    categories = CategoryHelper.call(joined_string)
    subjects_hash = {}
    subjects_hash["categories"] = categories
    subjects_hash
  end

  def get_category_main(course)

    #what if nil?
    subjects_array = course["subjects"].map { |subject| subject["name"] }
    return "{}" unless subjects_array.count >= 1
    subjects_hash = {}
    subjects_hash["categories"] = subjects_array
    subjects_hash.to_json
  end

  def get_description(course)
    if !course["full_description"].nil?
      return remove_strong_tags(course["full_description"])
    elsif !course["short_description"].nil?
      return remove_strong_tags(course["short_description"])
    else
      return nil
    end
  end

  def remove_strong_tags(description)
    description.gsub '<strong>', ''
    description.gsub '</strong>', ''
  end

  # REFACTOR
  def get_knowledge_level(course)
    if course["level_type"] == "High_school" || course["level_type"] == "Introductory"
      return 0
    elsif course["level_type"] == "Intermediate"
      return 1
    elsif course["level_type"] == "Advanced"
      return 2
    else
      return nil
    end
  end

  # Add currency
  def get_price(course)
    all_prices = []
    course["course_runs"].each do |course_run|
      prices = course_run["seats"].map { |seat| seat["price"].to_i }
      all_prices << prices.flatten
    end
    # returns the lowest price
    return "#{all_prices.flatten.min.to_i}"
  end

  def get_image(course)
    image = course["course_runs"][0]["image"]
    (image.nil?) ? nil : image["src"]
  end

  # just retrieves first owner
  def get_organization(course)
    owners = course["owners"]
    owners_array = []

    owners.each do |owner|
      owner["homepage_url"].nil? ? url = owner["marketing_url"] : url = owner["homepage_url"]
      organization_hash = {}
      organization_hash["name"] = owner["name"]
      organization_hash["description"] = owner["description"]
      organization_hash["img"] = owner["logo_image_url"]
      organization_hash["url"] = url
      owners_array << organization_hash
    end
    organization_hash = {}
    organization_hash["organizers"] = owners_array
    organization_hash
  end

  def get_duration(course)
    course = course["course_runs"][0]
    min = course["min_effort"]
    max = course["max_effort"]
    weeks = course["weeks_to_complete"]

    if min.nil? && max.nil?
      return "For #{weeks} weeks"
    elsif min.nil? && !max.nil?
      return "#{max} hours for #{weeks} weeks"
    elsif max.nil? && !min.nil?
      return "#{min} hours for #{weeks} weeks"
    else
      return "#{min}-#{max} hours for #{weeks} weeks"
    end
  end

  def get_completion_time(course)
    course = course["course_runs"][0]
    if course["max_effort"].present?
      if course["max_effort"] > 1
        return "long"
      else
        return "short"
      end
    end
  end

  def get_url(course)
    course = course["course_runs"][0]
    course["marketing_url"]
  end

  def get_status(course)
    course = course["course_runs"][0]
    # current time in ISO 8601 format
    today_date = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')

    unless course["start"].nil? || course["end"].nil?
      start_date = Time.parse(course["start"])
      end_date = Time.parse(course["end"])
      # set range
      date_range_active = start_date..end_date
      # compare if current date is in range
      return date_range_active === today_date
    end

  end

  def get_language(course)
    course = course["course_runs"][0]
    language = course["content_language"]
    return language == "en-us" ? "english" : nil
  end

  def get_instructor(course)
    course = course["course_runs"][0]
    instructor_array = (!course["instructor"].nil?) ? course["instructors"] : course["staff"]
    instructors_array = []
    instructor_array.each do |instructor|
      instructor_hash = {}
      full_name = "#{instructor['given_name']} #{instructor['family_name']}"
      instructor_hash["name"] = full_name
      instructor_hash["image"] = instructor["profile_image_url"]
      instructor_hash["bio"] = instructor["bio"]
      instructors_array << instructor_hash
    end
    instructors_hash = {}
    instructors_hash["instructors"] = instructors_array
    instructors_hash
  end
end
