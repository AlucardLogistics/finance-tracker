class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|

      #this will create the frinedships table with user_id and friend_id
      t.belongs_to :user
      #there is no model Friend so it will go through User
      t.belongs_to :friend, class: 'User'
      t.timestamps null: false
    end
  end
end
