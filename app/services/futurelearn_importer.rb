class FuturelearnImporter
  include HTTParty

  def self.call
    new.get_data
  end

  def get_data
    get_results
  end

  private

  def get_results
    url = "https://www.futurelearn.com/feeds/courses"

    # NUMBER OF COURSES TO RETRIEVE:
    number_of_courses = 1000

    input = self.class.get(url)

    input.take(number_of_courses).each do |course|
      instance_attributes = {}
      instance_attributes[:platform] = "futurelearn"
      instance_attributes[:title] = course["name"]
      instance_attributes[:subtitle] = course["introduction"]
      instance_attributes[:description] = edit_description(course["description"])
      instance_attributes[:price] = 0
      instance_attributes[:price_unit] = "€"
      instance_attributes[:image] = course["image_url"]
      instance_attributes[:organization] = get_organization(course)
      instance_attributes[:url] = course["url"]
      instance_attributes[:active] = get_status(course)
      instance_attributes[:language] = get_language(course)
      instance_attributes[:instructor] = get_instructor(course)
      instance_attributes[:duration] = get_duration(course)
      instance_attributes[:duration_unit] = nil
      instance_attributes[:knowledge_level] = get_knowledge_level(course)
      instance_attributes[:completion_time] = get_completion_time(course)
      instance_attributes[:university_course] = get_university_course(course)
      instance_attributes[:categories] = get_categories(course)

      if validator(instance_attributes)
        new_course = Course.new(instance_attributes)
        new_course.save!
      end
    end
  end

  # HELPER METHODS

  def validator(instance_attributes)
    if !category_validation(instance_attributes[:categories])
      return false
    # course language has to be English
    elsif instance_attributes[:language] != "english"
      return false
    elsif instance_attributes[:active] == nil
      return false
    else
      return true
    end
  end

  def category_validation(json)
    return false if json == "{}"
    input_hash = JSON.parse(json)
    course_categories = input_hash["categories"]
    valid_categories = ["Tech & Coding"]
    valid_categories.each do |category|
      return false unless course_categories.include?(category)
    end
  end

  def get_organization(course)
    owner = course["organisation"]
    owners_array = []

    organization_hash = {}
    organization_hash["name"] = owner["name"]
    organization_hash["description"] = ""
    organization_hash["img"] = owner["logo_url"]
    organization_hash["url"] = owner["url"]
    owners_array << organization_hash

    organization_hash = {}
    organization_hash["organizers"] = owners_array
    organization_hash
  end

  def get_status(course)
    return false if course["runs"].last["start_date"].blank? && course["open_for_enrolment"].blank?
    if course["runs"].last["start_date"].nil?
      return nil  #####method needs to be validated ---> only quick fix
    end
    last_start_date = course["runs"].last["start_date"].to_date
    today = Date.today
    if course["open_for_enrolment"] = true && today >= last_start_date
      return true
    else
      return false
    end
  end

  def get_language(course)
    language = course["language"]
    return language == "en" ? "english" : nil
  end

  def get_instructor(course)
    instructor = course["educator"]
    instructors_array = []

    instructor_hash = {}
    instructor_hash["name"] = instructor
    instructor_hash["image"] = nil
    instructor_hash["bio"] = nil
    instructors_array << instructor_hash

    instructors_hash = {}
    instructors_hash["instructors"] = instructors_array
    instructors_hash
  end

  def get_duration(course)
    run =  course["runs"].last
    weeks = run["duration_in_weeks"]
    hours = course["hours_per_week"]
    if weeks == 1 && hours > 1
      return "#{hours} hours for #{weeks} week"
    elsif weeks > 1 && hours == 1
      return "#{hours} hour for #{weeks} weeks"
    else
      return "#{hours} hours for #{weeks} weeks"
    end
  end

  def get_completion_time(course)
    run =  course["runs"].last
    weeks = run["duration_in_weeks"]
    return weeks <= 1 ? "short" : "long"
  end

  def get_university_course(course)
    organizer_name = course["organisation"]["name"]

    ["university", "college"].any? { |word| organizer_name.downcase.include?(word) }
  end

  def get_categories(course)
    categories_array = course["categories"]
    return "{}" unless categories_array.count >= 1
    subjects_hash = {}
    subjects_hash["categories"] = categories_array
    subjects_hash.to_json
  end

  def get_knowledge_level(course)
    description = course["description"]
    title = course["name"]
    if ["advanced", ].any? { |level| description.downcase.include?(level) || title.downcase.include?(level)}
      return 2
    elsif ["intermediate", ].any? { |level| description.downcase.include?(level) || title.downcase.include?(level)}
      return 1
    elsif ["beginner", "introduction", "getting started" ].any? { |level| description.downcase.include?(level) || title.downcase.include?(level) }
      return 0
    else
      return nil
    end
  end

  # change h tags to p tags
  def edit_description(description)
    description.gsub '<h2>', '<p>'
    description.gsub '</h2>', '</p>'
    description.gsub '<h2 ', '<p '
    description.gsub '</h3>', '</p>'
    description.gsub '<h3 ', '<p '
    description.gsub '</h4>', '</p>'
    description.gsub '<h4 ', '<p '
  end

end
