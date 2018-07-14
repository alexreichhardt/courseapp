class RemovePriceFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :price
  end
end
