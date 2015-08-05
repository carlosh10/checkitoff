# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all


 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   #role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'carlos@comex.guru',
   password: 'helloworld',
   #role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!
puts "#{User.count} users created"

 lists = List.all
 puts "#{List.count} lists generated."

# Create items for the lists
83.times do
  item = Item.create!(
    list: lists.sample,
    name: Faker::Lorem.word,
    created_at: (Time.now - Random.new.rand(0..8).days)
    )
end
puts "#{Item.count} todo items generated"

puts "Seed finished"




