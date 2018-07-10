require "base64"
require 'pp'
class UdemyImporter
  include HTTParty
    base_uri 'https://www.udemy.com/api-2.0/courses'
  # fetch API
  # transform each relevant key value pair to the form we need according to schema
  # create instance of course

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course
    new.get_data
  end

  def get_data
    get_results
  end

  private

  def get_ids
    @auth = { username:ENV['YOUR_CLIENT_ID'] , password: ENV['YOUR_CLIENT_SECRET'] }
    @options = {basic_auth: @auth}
    ids = []

    b = (1..500).to_a
    b.each do |i|

      number = i.to_i
      url = "/?page=#{number}&page_size=100&category=Development"

      response = self.class.get(url, @options)
      if response.code == 400
        break
      elsif response.code == 429
        binding.pry
        puts "count: #{number}"

        break

      else
        response["results"].each do |course|
        ids << course["id"]
        end
      end
      p "id count: #{ids.size}"
      if number % 10 == 0
        puts "sleeping for 1 minute.."
        sleep(61)
      end
    end

    return ids

  end

  def get_results
    instance_attributes = {}
    #instance_attributes[:category] = {}
    hi = []
    ids = get_ids
    ids.each do |id|

      url = "/#{id}?fields[course]=@all"
      response = self.class.get(url, @options)

      instance_attributes[:title] = response["title"]
      instance_attributes[:subtitle] = nil
      instance_attributes[:description] = response["description"]
      instance_attributes[:category] = categories(response["primary_category"]["title"], response["primary_subcategory"]["title"])
      instance_attributes[:price] = edit_price(response["price"], response["discount_price"] )
      instance_attributes[:image] = response["image_100x100"]
      instance_attributes[:organization] = nil
      instance_attributes[:url] = create_url(response["url"])
      instance_attributes[:active] = active_status(response["status_label"])
      instance_attributes[:language] = "english"
      instance_attributes[:instructor] = instructors(response["visible_instructors"])
      instance_attributes[:duration] = (response["estimated_content_length"].to_i) / 60
      instance_attributes[:duration_unit] = "hours"
      instance_attributes[:knowledge_level] = skill_level(response["instructional_level"])
      hi << instance_attributes
      p hi.size
    end
    return "size: #{hi.size}"
  end

  def categories(cat_primary, cat_sub)
    subjects_array = [cat_primary, cat_sub]
    subjects_hash = {}
    subjects_hash["subjects"] = subjects_array
    subjects_hash
  end

  def active_status(input)
    if input == "Live"
      true
    else
      false
    end
  end

  def instructors(input)
    instructor_array = input
    instructors_array = []
    instructor_array.each do |instructor|
      instructor_hash = {}
      instructor_hash["name"] = instructor["title"]
      instructor_hash["image"] = instructor["image_100x100"]
      instructor_hash["bio"] = instructor["job_title"]
      instructors_array << instructor_hash
    end
    instructors_hash = {}
    instructors_hash["instructors"] = instructors_array
    instructors_hash
  end

  def skill_level(input)
    if input == "All Levels"
      return 1
    elsif input == "Beginner Level"
      return 0
    elsif input == "Intermediate Level"
      return 1
    elsif input == "Expert Level"
      return 2
    end
  end

  def create_url(input)
    return "https://www.udemy.com#{input}"
  end

  def edit_price(list, discount)
    if discount.nil? && list == "Free"
      return "$0"
    elsif discount.nil? && list != "Free"
      return input
    elsif
      i = discount["price_string"]
      return i
    end
  end
end

# curl --user G61VPVDJ4dsoO84P9tN8hdOfEjmau1KruprjC4q7:ENu4svctGtFONsqAZRM1b6HSMkE6jI1GBvNRPaeIoVKTL6u72jkR6mbUDTh4UpEFuAqzTiDT6BYTqBhxybzr8o0Sn9syEerCALnsdn64QZmPH4bvrvslOxVsG20khn1a https://www.udemy.com/api-2.0/courses





