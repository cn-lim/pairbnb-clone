# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = {}
user['encrypted_password'] = 'asdf'

20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['born'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

40.times do 

    listing['title'] = Faker::App.name
    listing['description'] = Faker::Hipster.sentence
    
    listing['room_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['num_of_room'] = rand(0..5)
    listing['max_guests'] = rand(1..10)

    listing['country_code'] = Faker::Address.country_code

    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)


    listing['user_id'] = uids.sample

    Listing.create(listing)
end