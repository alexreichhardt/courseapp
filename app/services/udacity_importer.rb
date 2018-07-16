class UdacityImporter
  include HTTParty

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course

    Course.destroy_all

    response = HTTParty.get('https://www.udacity.com/public-api/v0/courses')





    if response == nil
      puts "nothing"
    else



    response["courses"].each do |course|
      full_description = course["summary"] + " " + course["expected_learning"] + " " + course["required_knowledge"]


      puts "creating a course.."
      Course.create!(
         title: course["title"],
         subtitle: course["subtitle"],
         description: full_description,
         knowledge_level: course["level"] == "" ? "undetermined" : course["level"] ,
         categories: {subjects: course["tracks"]},
         price: 0,
         price_unit: "€",
         image: course["image"],
         organization: { organizers: course["affiliates"] == [] ? nil : UdacityImporter.format_organization(course["affiliates"]) },
         duration: course["expected_duration"] ,
         duration_unit: course["expected_duration_unit"],
         url: course["homepage"],
         active: true,
         language: "English",
         instructor: { instructors: course["instructors"] == [] ? nil : UdacityImporter.format_instructor(course["instructors"]) }
         )



    end
  end


  end

  # def self.knowledge_level_correction(indicated_level)


  #   if indicated_level == nil
  #     # puts "222222222222"
  #     # puts "222222222222"
  #     # puts "222222222222"
  #     "undetermined"
  #   else
  #     indicated_level
  #   end
  # end



  def self.format_organization(array_of_affiliates )

    organization_array = []
    array_of_affiliates.each do |affiliate|
      organization_array << { image: affiliate["image"], name: affiliate["name"] }
    end
    organization_array
  end


  def self.format_instructor(array_of_instructors)

    instructors_array = []
    array_of_instructors.each do |instructor|
      instructors_array << { bio: instructor["bio"], image: instructor["image"], name: instructor["name"] }
    end
    instructors_array
  end

end







