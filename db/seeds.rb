# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake users with 2 acts each...'

10.times do

  user_seed = User.new(
    email: Faker::Internet.email,
    password: 'gigabeat',
    password_confirmation: 'gigabeat'
    )

  user_seed.save


  # Creating 2 acts for each user
  act_seed_1 = Act.new(
    name: Faker::RockBand.name,
    good_for: ["Parties", "Weddings", "Festivals"].sample,
    description: Faker::Lorem.paragraph,
    photo: "",
    users_id: user_seed.id,
    genre: ["Rock", "Rap", "Acoustic"].sample
    )

  act_seed_1.save!

  act_seed_2 = Act.new(
    name: Faker::RockBand.name,
    good_for: ["Parties", "Weddings", "Festivals"].sample,
    description: Faker::Lorem.paragraph,
    photo: "",
    users_id: user_seed.id,
    genre: ["Rock", "Rap", "Acoustic"].sample
    )

  act_seed_2.save!

end

puts 'Finished!'
