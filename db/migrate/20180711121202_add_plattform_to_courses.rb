class AddPlattformToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :plattform, :string
  end
end
