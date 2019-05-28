require 'faker'

puts "clearing db"
type_array = %w(sport culture indoor outdoor chill relax beach karting)
User.destroy_all
Reservation.destroy_all
Activity.destroy_all

20.times do
User.create!({
  firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address

  })
end
puts "done creating users"
puts "creatin 2 activities for each user"

User.all.each do |single_user|
  2.times do
    single_user.activity.build({
      name: Faker::Name.first_name,
      location: Faker::Address.full_address,
      type: type_array.sample
      price: rand(25),
      description: Faker::Lorem.sentence,
      nbmaxplaces: rand(12),
      start_date: Faker::Date.forward(10),
      end_date: Faker::Date.forward(35),

       })
  end
end
puts "done creating activities related to users"
puts "creating reservations linking users& activities"

User.first(10).each do |active_user|
  active_user.reservation.activity = sample(Activity.all)
  active_user.reservation.build({
    date: Faker::Date.forward(50),
    nbparticipants: rand(6),
    status: "pending",
    totalprice: rand(150),

  })

end
puts "reservations should be linking models"


puts "job's done"

