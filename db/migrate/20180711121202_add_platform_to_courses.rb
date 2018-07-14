class AddPlatformToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :platform, :string
  end
end
