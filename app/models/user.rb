class User < ActiveRecord::Base
	# Remember to create a migration!
	include BCrypt

	has_many :tweets, dependent: :destroy
	has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	has_many :active_relationships, class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy

	has_secure_password

	def feed
		Tweet.where("user_id = ?", id)
	end

	# Follows a user
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	# Unfollow a user
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	# Returns true if the current user is following the other user
	def following?(other_user)
		following.include?(other_user)
	end

	# Returns true if a password reset has expired.
	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end


end
