class UdacityNanodegreeImporter
  include HTTParty

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course


    response = HTTParty.get('https://www.udacity.com/public-api/v0/courses')

    if response == nil
      puts "nothing"
    else
    end


    response["degrees"].each_with_index do |course, i|

      if i < 5

        full_description = course["summary"] + " " + course["expected_learning"]

      puts "creating a course.."
      Course.create(
        title: course["title"],
        subtitle: course["subtitle"],
        description: full_description,
        knowledge_level: course["level"],
        categories: {subjects: course["tracks"]},
        price: "$0",
        image: course["image"],
        organization: { organizers: course["affiliates"] == [] ? nil : UdacityNanodegreeImporter.format_organization(course["affiliates"]) },
        duration: course["expected_duration"] ,
        duration_unit: course["expected_duration_unit"],
        url: course["homepage"],
        active: true,
        language: "English",
        instructor: { instructors: course["instructors"] == [] ? nil : UdacityNanodegreeImporter.format_instructor(course["instructors"]) }
        )

      else
      break
      end


    end


  end



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







