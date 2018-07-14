class AddPriceUnitToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :price_unit, :string
  end
end

