# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CATEGORY = ['wind instruments', 'drums', 'guitars', 'keyboards']
## For instruments: ##
40.times do
  instru = Instrument.new(
    name: Faker::Music.instrument,
    category: CATEGORY.sample,
    location: Faker::Address.city,
    rating: [1,2,3,4,5].sample,
    description: Faker::Lorem.sentence,
    price: rand(330)
  )
  p instru.save
end

40.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rating: [1,2,3,4,5].sample,
    bio: Faker::Lorem.sentence
  )
end
