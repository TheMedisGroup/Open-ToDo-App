# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


  10.times do
    user = User.new(
      username: Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
      )
    user.save!
  end
  user = User.all

  20.times do
    List.create!(
        user:         user.sample,
        name:        Faker::Lorem.sentence,
        # description:  Faker::Lorem.paragraph
        )
  end
  lists = List.all

  50.times do
    item = Item.create!(
      description:    Faker::Lorem.paragraph,
      list: lists.sample
      )
    item.update_attributes!(created_at: rand(10.minutes .. 6.days).ago)
  end

  admin = User.new(
    username:  'AdminUser',
    email:     'admin@example.com',
    password:  'helloworld'
    )
    admin.save!

  mike = User.new(
    username: 'mike',
    email:    'medis.michael@gmail.com',
    password: 'helloword'
    )
    mike.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
