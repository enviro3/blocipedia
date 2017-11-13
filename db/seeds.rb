# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# create fake users
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "#{User.count} users were created!"

# create fake wikis
30.times do
  wiki = Wiki.create!(
    title: Faker::Job.title,
    body: Faker::Hobbit.quote
  )
end

puts "#{Wiki.count} wikis were created!"

# create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

# create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
   role:     'member'
 )

# create a premium member
 premium = User.create!(
   name:     'Premium User',
   email:    'premium@example.com',
   password: 'helloworld',
   role:     'premium'
 )
