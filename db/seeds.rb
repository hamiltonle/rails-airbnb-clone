# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake acts...'

10.times do

  act_seed = Act.new(
    name: Faker::RockBand,
    good_for: ["Parties", "Weddings", "Festivals"].sample,
    description: Faker::Lorem.paragraph,
    genre: ["Rock", "Rap", "Acoustic"].sample

    )

  act_seed.save!
end

puts 'Finished!'
