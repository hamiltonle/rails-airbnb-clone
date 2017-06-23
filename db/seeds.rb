# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake users with 1-3 acts each...'

10.times do

  user = User.new(
    email: Faker::Internet.email,
    password: 'bandwagon',
    password_confirmation: 'bandwagon'
    )
  puts "saved a user"
  url = "https://source.unsplash.com/collection/138794/300x300"

  user.save!
  user.photo_url = url
  user.save!
  puts "user photo done"
  # Creating 1-3 acts for each user
  (1..3).to_a.sample.times do
    puts "seed"

    act_seed = Act.new(
      name: Faker::RockBand.name,
      good_for: ["Parties", "Weddings", "Festivals", "Events", "Birthdays"].sample,
      description: Faker::Lorem.paragraph,
      photo: "",
      users_id: nil,
      genre: ["Rock", "Rap", "Acoustic", "Jazz", "Punk", "Pop"].sample
      )
    act_seed.user = user
    act_seed.save!

    urls = [
      'https://source.unsplash.com/collection/383590',
      'https://source.unsplash.com/collection/572418/300x200',
      'https://source.unsplash.com/collection/520930/300x200',
      'https://source.unsplash.com/collection/639550/300x200',
      'https://source.unsplash.com/collection/928171/300x200',
      'https://source.unsplash.com/collection/632279/300x200'
    ]
    puts "act photos done"

    act_seed.photo_urls = urls # Multi-upload happens here
    act_seed.save!

    user.acts << act_seed
  end

end

puts 'Finished!'
