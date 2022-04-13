# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding Users...'


User.create(
  email: 'test@test.com',
  name: 'Test',
  password: '123456',
  password_confirmation: '123456'
)

users = []

20.times do
  users << User.create(
    email: Faker::Internet.unique.email,
    name: Faker::Games::Pokemon.unique.name,
    password: '123456',
    password_confirmation: '123456'
  )
end

events = []

puts 'Seeding Events...'

users.each do |user|
  2.times do 
    events << Event.create(
      host_id: user.id,
      title: " #{Faker::Hobby.activity} party!",
      description: 'Just like the title says',
      date: Faker::Date.in_date_period,
      location: Faker::Address.city
    )
  end
end

prng = Random.new

puts 'Seeding Attendances...'

users.each do |user|
  available_events = events.reject { |e| e.host_id == user.id }.shuffle
  prng.rand(2..5).times do
    event = available_events.shift
    Attendance.create(attended_event_id: event.id, event_attendee_id: user.id)
  end
end

puts 'Seeding Done.'
