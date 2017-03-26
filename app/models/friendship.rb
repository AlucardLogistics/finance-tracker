class Friendship < ActiveRecord::Base
  
  belongs_to :user
  #belongs to :frineds from the User class in User controller
  belongs_to :friend, :class_name => 'User'
end
