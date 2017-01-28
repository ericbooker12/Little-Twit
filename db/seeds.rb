require 'faker'

User.create!(username:  "Example User", password:"123")

99.times do |n|
	name  = Faker::Name.first_name
	password = "123"
	User.create!(
		username: name,
		email: "example-#{n+1}@twit.org",
		password: password)
end