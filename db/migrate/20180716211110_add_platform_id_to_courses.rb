class AddPlatformIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :platform_id, :string
  end
end
