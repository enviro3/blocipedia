# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create a fake User
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end

# puts "#{User.count} users were created!"
#
# #create a fake wiki
# wiki = Faker::Wiki.name
#
#
# # Create an admin user
#  admin = User.create!(
#    name:     'Admin User',
#    email:    'admin@example.com',
#    password: 'helloworld',
#    role:     'admin'
#  )
#
#  # Create a member
#  member = User.create!(
#    name:     'Member User',
#    email:    'member@example.com',
#    password: 'helloworld'
#  )
#
#  # Create a premium member
#  premium = User.create!(
#    name:     'Premium User',
#    email:    'premium@example.com',
#    password: 'helloworld'
#  )
