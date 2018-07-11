class RemoveDurationFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :duration, :integer
  end
end
