
require 'json'

input_json = "{\"categories\":[\"Test\",\"Biology \\u0026 Life Sciences\",\"History\"]}"


def category_validation(json)
  input_hash = JSON.parse(json)
  course_categories = input_hash["categories"]
  valid_categories = ["History", "Science"]

  valid_categories.each do |category|
    if course_categories.include?(category)
      return true
    end
  end

  # valid_categories.each { |category| course_categories.include?(category) ? true : next}
  return false
end

p category_validation(input_json)



# p category_array.include?("History")

