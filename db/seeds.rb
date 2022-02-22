# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "destroying instruments and users"
Instrument.destroy_all
User.destroy_all

puts "Creating 10 users + instruments"

# CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories']
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rating: [1, 2, 3, 4, 5].sample,
    bio: Faker::Lorem.sentence
  )
  user.save!
  ## For instruments: ##
  [0, 1, 2].sample.times do
    instru = Instrument.new(
      name: Faker::Music.instrument,
      category: Instrument::CATEGORY.sample,
      location: Faker::Address.city,
      rating: [1, 2, 3, 4, 5].sample,
      description: Faker::Lorem.sentence,
      price: rand(50)
    )
    instru.user = user
    instru.save!
    # p instru.errors.messages
  end
end
