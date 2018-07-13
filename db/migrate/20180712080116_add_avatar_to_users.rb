class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, default: "http://marclimoservices.com/wp-content/uploads/2017/05/facebook-default.png"
  end
end
