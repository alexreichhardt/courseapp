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
    page_num = 1
    loop do
      if page_num == 25
        p ids
        return ids
        break
      end
      url = "/?page=#{page_num}&page_size=100&category=Development&language=en"
      response = self.class.get(url, @options)

      p "Error Code #{response.code}"
      case response.code
      when 404
        puts response
        return ids
        break
      when 429
        puts response
        return ids
        break
      when 400
        puts response
        return ids
        break
      else
        response["results"].each do |course|
           ids << course["id"]
        end
        p "id_count: #{page_num}00"
        if page_num % 10 == 0
          puts "sleeping for 1 minute.."
          sleep(61)
        end
        page_num += 1
      end
    end
    return ids



  end

  def get_results
    ids = get_ids
    ids.each do |id|
      p "fetch data"
      instance_attributes = {}
      url = "/#{id}?fields[course]=@all"

      response = self.class.get(url, @options)
      case response.code
      when 404
        puts response

        break
      when 429
        puts response
        break
      when 400
        puts response
        break
      when 443
        puts "#{id}"
        puts response
        break
      else
        if Course.where(platform: "udemy", platform_id: response["id"]).size != 0
          p "already exists in db"
          next
        else
          instance_attributes[:platform_id] = response["id"]
          instance_attributes[:platform] = "udemy"
          instance_attributes[:title] = response["title"]
          instance_attributes[:subtitle] = nil
          instance_attributes[:description] = remove_strong_tags(response["description"])
          instance_attributes[:categories] = categories(response)
          instance_attributes[:price] = edit_price(response["price"], response["discount"])
          instance_attributes[:price_unit] = price_unit(response)
          instance_attributes[:image] = response["image_100x100"]
          instance_attributes[:organization] = nil
          instance_attributes[:url] = create_url(response["url"])
          instance_attributes[:active] = active_status(response["status_label"])
          instance_attributes[:language] = "english"
          instance_attributes[:instructor] = instructors(response["visible_instructors"])
          instance_attributes[:duration] = get_duration(response["estimated_content_length"].to_s) +" "+get_duration_unit(response["estimated_content_length"])
          instance_attributes[:duration_unit] = get_duration_unit(response["estimated_content_length"])
          instance_attributes[:knowledge_level] = skill_level(response["instructional_level"])
          instance_attributes[:completion_time] = get_completion_time(response["estimated_content_length"])

          i = Course.new(instance_attributes)
          i.save!
          p "finished with #{i}"
        end
      end
      #p instance_attributes
    end
    #return instance_attributes
  end

  def price_unit(input)
    if input["is_paid"] == false || input["is_paid"].nil?
      "€"
    elsif !input["price_detail"]["currency_symbol"].nil?
      input["price_detail"]["currency_symbol"]
    else
      nil
    end
  end

  def get_duration(duration)
    if !duration.nil?
      a = (duration.to_i / 60).to_s
      if a == "0"
        "1"
      else
        a
      end
    else
      nil
    end
  end

  def get_duration_unit(duration)
    if !duration.nil? && (duration.to_i / 60) < 2
      "hour"
    elsif  !duration.nil?
      "hours"
    else
      nil
    end
  end

  def categories(course)

    title = course["title"]
    description = course["description"]
    joined_string = title + description
    categories = CategoryHelper.call(joined_string)
    subjects_hash = {}
    subjects_hash["categories"] = categories
    subjects_hash
    # if !cat_primary.nil? && !cat_sub.nil?
    #   subjects_array = [cat_primary, cat_sub]
    # elsif !cat_primary.nil? && cat_sub.nil?
    #   subjects_array = [cat_primary]
    # elsif cat_primary.nil? && !cat_sub.nil?
    #   subjects_array = [cat_sub]
    # else
    #   return nil
    # end


  end

  def remove_strong_tags(description)
    doc = Nokogiri::HTML("#{description}")
    doc.css('strong').each { |node| node.replace(node.children) }
    doc.to_s
    # doc.at_xpath("//p").to_s
  end

  def get_completion_time(content_length)
    hours_of_content = content_length.to_i / 60
    if hours_of_content > 17
      return "long"
    else
      return "short"
    end
  end

  def active_status(input)
    if input == "Live" && !input.nil?
      true
    else
      false
    end
  end

  def instructors(input)
    if !input.nil?
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
    else
      nil
    end
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
    else
      nil
    end
  end

  def create_url(input)
    return "https://www.udemy.com#{input}"
  end

  def edit_price(list, discount)
    if list == "Free" || discount.nil?
      0
    elsif discount&.dig("price", "amount") != discount&.dig("list_price", "amount")
      discount&.dig("price", "amount")
    else
      discount&.dig("list_price", "amount")
    end
  end

end
