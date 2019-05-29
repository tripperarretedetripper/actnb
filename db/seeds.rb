require 'faker'

puts "clearing db"
type_array = %w(sport culture indoor outdoor chill relax beach karting)
Booking.destroy_all
Activity.destroy_all
User.destroy_all

20.times do
User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address,
  password: 'unpasswordlong'

  })
end
puts "done creating users"
puts "creatin 2 activities for each user"

User.all.each do |single_user|
  2.times do
    Activity.create!({
      name: Faker::Name.first_name,
      address: Faker::Address.full_address,
      type_activity: type_array.sample,
      price: rand(25),
      description: Faker::Lorem.sentence,
      max_participants: rand(12),
      start_date: Faker::Date.forward(10),
      end_date: Faker::Date.forward(35),
      seller: single_user
       })
  end
end
puts "done creating activities related to users"
puts "creating Booking linking users& activities"

User.first(10).each do |active_user|
  Booking.create!({
    date: Faker::Date.forward(50),
    participants_number: rand(6),
    status: "pending",
    total_price: rand(150),
    activity: Activity.all.sample,
    user: active_user
  })
end
puts " should be linking models"
puts "creating fake users with known ids"
User.create!({
  first_name: "Jean-michel",
  last_name: "iencli",
  email: "jmdupont@wagon.com",
  phone: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address,
  password: 'password'

  })
User.create!({
  first_name: "jm",
  last_name: "buyer",
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address,
  password: 'password'

  })
User.create!({
  first_name: "jm",
  last_name: "seller",
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address,
  password: 'password'

  })

puts "job's done"

