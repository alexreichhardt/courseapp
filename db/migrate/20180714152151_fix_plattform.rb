class Fixplatform < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :plattform, :platform
  end
end
