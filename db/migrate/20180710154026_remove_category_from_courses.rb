class RemoveCategoryFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :category, :string
  end
end
