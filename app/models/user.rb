class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :active_relationships, class_name: 'Relationship', foreign_key: "follower_id"
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: "followed_id"
  has_many :tweets

  has_secure_password
end
