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
    number_of_courses = 100 # 1319
    # STARTING POINT IN CATALOGUE
    starting_point = 0
    # URL FOR DEV AND PROD (ARBITRARY NUMBER OF COURSES)
    url = "https://prod-edx-discovery.edx.org/api/v1/catalogs/284/courses/?limit=#{number_of_courses}&offset=#{starting_point}"
    # header
    options = {:headers => {'Authorization' => 'JWT ' + token }}

    input = self.class.get(url, options)

    input["results"].each do |course|
      instance_attributes = {}
      #instance_attributes[:plattform] = "edx"
      instance_attributes[:title] = course["title"]
      instance_attributes[:subtitle] = nil
      instance_attributes[:description] = get_description(course)
      instance_attributes[:categories] = get_category(course)
      instance_attributes[:price] = get_price(course)
      instance_attributes[:image] = get_image(course)
      instance_attributes[:organization] = get_organization(course)
      instance_attributes[:url] = get_url(course)
      instance_attributes[:active] = get_status(course)
      instance_attributes[:language] = get_language(course)
      instance_attributes[:instructor] = get_instructor(course)
      instance_attributes[:duration] = get_duration(course)
      instance_attributes[:duration_unit] = nil
      instance_attributes[:knowledge_level] = get_knowledge_level(course)

      if validator(instance_attributes)
        new_course = Course.new(instance_attributes)
        new_course.save!
      end
    end
  end

  # HELPER METHODS

  def validator(course_attributes)
    if !category_validation(course_attributes[:categories])
      return false
    # course language has to be English
    elsif course_attributes[:language] != "English"
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
  def get_category(course)
    # what if nil?
      subjects_array = course["subjects"].map { |subject| subject["name"] }
      return "{}" unless subjects_array.count > 1
      subjects_hash = {}
      subjects_hash["categories"] = subjects_array
      subjects_hash.to_json
  end

  def get_description(course)
    if !course["full_description"].nil?
      return course["full_description"]
    elsif !course["short_description"].nil?
      return course["short_description"]
    else
      return nil
    end
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
    return "#{all_prices.flatten.min} USD"
  end

  def get_image(course)
    image = course["course_runs"][0]["image"]
    (image.nil?) ? nil : image["src"]
  end

  # just retrieves first owner
  def get_organization(course)

    owner = course["owners"][0]
    owner["homepage_url"].nil? ? url = owner["marketing_url"] : url = owner["homepage_url"]
    organization_hash = {
      img: owner["logo_image_url"],
      name: owner["name"],
      description: owner["description"],
      homepage: url
    }
    organization = {}
    organization["Organization"] = organization_hash

    return organization.to_json
  end

  def get_duration(course)
    course = course["course_runs"][0]
    min = course["min_effort"]
    max = course["max_effort"]
    weeks = course["weeks_to_complete"]

    if min.nil? && !max.nil?
      return "#{max} hours for #{weeks}"
    elsif max.nil? && !min.nil?
      return "#{min} hours for #{weeks}"
    else
      return "#{min}-#{max} hours for #{weeks} weeks"
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
    return language == "en-us" ? "English" : nil
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
    instructors_hash.to_json
  end
end
