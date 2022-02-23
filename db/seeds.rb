# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' } || { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "destroying instruments and users"
Instrument.destroy_all
User.destroy_all

puts "Creating 3 users + 7 instruments"

# CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories']

user1 = User.new(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  rating: [1, 2, 3, 4, 5].sample,
  bio: Faker::Lorem.sentence
)
user1.save!
##
user2 = User.new(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  rating: [1, 2, 3, 4, 5].sample,
  bio: Faker::Lorem.sentence
)
user2.save!
##
user3 = User.new(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  rating: [1, 2, 3, 4, 5].sample,
  bio: Faker::Lorem.sentence
)
user3.save!
## For 10 instruments: ##
instru = Instrument.new(
  name: 'Electric guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 4,
  description: 'My favorite guitar',
  price: 25
)
instru.user = user1
instru.save!
##
instru = Instrument.new(
  name: 'Bass',
  category: 'Strings',
  location: 'Paris',
  rating: 4,
  description: "Haven't used it in a while",
  price: 40
)
instru.user = user1
instru.save!
##
instru = Instrument.new(
  name: 'Folk guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "I can rent it only in weekdays",
  price: 35
)
instru.user = user2
instru.save!
##
instru = Instrument.new(
  name: 'Electric guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "Bender",
  price: 70
)
instru.user = user2
instru.save!
##
instru = Instrument.new(
  name: 'Guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "Guitar",
  price: 32
)
instru.user = user1
instru.save!
##
instru = Instrument.new(
  name: 'Violon',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "Good condition",
  price: 55
)
instru.user = user2
instru.save!
##
instru = Instrument.new(
  name: 'Gibsonnn electric guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "Good condition",
  price: 80
)
instru.user = user2
instru.save!
##
instru = Instrument.new(
  name: 'Acoustic guitar',
  category: 'Strings',
  location: 'Paris',
  rating: 5,
  description: "Good condition",
  price: 20
)
instru.user = user2
instru.save!
# p instru.errors.messages
instru = Instrument.new(
  name: 'Capodaster',
  category: 'Cables & Accessories',
  location: 'Paris',
  rating: 5,
  description: "A good capodaster",
  price: 55
)
instru.user = user3
instru.save!








# INSTRUMENTS = ['Electric Guitar', 'Acoustic Guitar', 'Flute', 'Trumpet', 'Clarinet', 'Cello', 'Harp', 'Xylophone',
  # 'Harmonica', 'Accordion', 'Organ', 'Piano', 'Ukelele', 'Saxophone', 'Drums', 'Violin', 'Bass Guitar', 'Oboe',
  # 'Microphone', 'Capodaster']
# 10.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(min_length: 8, mix_case: true, special_characters: true),
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     rating: [1, 2, 3, 4, 5].sample,
#     bio: Faker::Lorem.sentence
#   )
#   user.save!
#   ## For instruments: ##
#   [0, 1, 2].sample.times do
#     instru = Instrument.new(
#       name: Faker::Music.instrument,
#       category: Instrument::CATEGORY.sample,
#       location: Faker::Address.city,
#       rating: [1, 2, 3, 4, 5].sample,
#       description: Faker::Lorem.sentence,
#       price: rand(50)
#     )
#     instru.user = user
#     instru.save!
#     # p instru.errors.messages
#   end
# end
