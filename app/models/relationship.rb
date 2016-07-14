class Relationship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

end
