class AddUniversityCourseToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :university_course, :boolean
  end
end
