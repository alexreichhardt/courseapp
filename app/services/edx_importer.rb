class EdxImporter
  include HTTParty
  base_uri 'https://api.edx.org/'
  # fetch API
  # transform each relevant key value pair to the form we need according to schema
  # create instance of course
  def initialize
    @data = nil
  end

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course
    new.get_data
  end

  def get_data
    token = get_access_token
    get_results(token["access_token"])
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
    options = {:headers => {'Authorization' => 'JWT ' + token }}
    url = "/catalog/v1/catalogs/284/courses/" # first url
    json = self.class.get(url, options)

    # titles = []
    json["results"].each do |course|
      puts course["title"]
      puts get_instructor(course)
      puts "---"
    end

  end

  # "Translator methods"

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

  # as jsonb
  def get_category(course)
    subjects_array = course["subjects"].map { |subject| subject["name"] }
    subjects_hash = {}
    subjects_hash["categories"] = subjects_array
    subjects_hash.to_json
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
    image_url = image["src"]
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
    # make string a Time object
    start_date = Time.parse(course["start"])
    end_date = Time.parse(course["end"])

    # set range
    date_range_active = start_date..end_date

    # compare if current date is in range
    return date_range_active === today_date
  end

  def get_language(course)
    course = course["course_runs"][0]
    language = course["content_language"]
    return language == "en-us" ? "English" : nil
  end

  def get_instructor(course)
    course = course["course_runs"][0]
    instructor = (!course["instructor"].nil?) ? course["instructors"] : course["staff"]
    instructor_array = instructor
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
  # {:subjects => ["goodbye", "test"]}

    # t.string "title"
    # t.string "subtitle"
    # t.text "description"
    # t.integer "knowledge_level"
    # t.string "category"
    # t.string "price"
    # t.string "image"
    # t.jsonb "organization", default: "{}"
    # t.integer "duration"
    # t.string "duration_unit"
    # t.string "url"
    # t.boolean "active", default: false, null: false
    # t.string "language"
    # t.jsonb "instructor", default: "{}"

    # titles

    # TO DO
    #   loop through all result pages
    #   create helper methods
    #   create instances


    # unless self.class.get(url, options)["next"].nil?
    #   url = self.class.get(url, options)["next"]
    #   results << self.class.get(url, options)["next"]
    #   binding.pry
    # end



end
