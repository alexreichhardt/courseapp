 class AddNamesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    rename_column :users, :birthdate, :birth_date
  end
end
