class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, default: "https://static.boredpanda.com/blog/wp-content/uploads/2018/03/funny-embarrassing-childhood-youth-pictures-coverimage.jpg"
  end
end
