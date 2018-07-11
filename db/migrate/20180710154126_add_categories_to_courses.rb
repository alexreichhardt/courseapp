class AddCategoriesToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :categories, :jsonb
  end
end
