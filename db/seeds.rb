# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Guest", last_name: "User",
  email: "guest@sparailsapp.com", password: "123456", 
  password_confirmation: "123456")

180.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name:  first_name,
                last_name: last_name,
                email: email,
                password:              password,
                password_confirmation: password)
  user = User.last
  content = Faker::StarWars.quote
  user.microposts.create(content: content )
end

