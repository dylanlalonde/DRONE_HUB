# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "deleting records"
Booking.destroy_all
Drone.destroy_all
User.destroy_all

puts 'making record'

5.times do
  # creating the parameters for the user
  email =  Faker::Internet.email
  password = Faker::HowIMetYourMother.catch_phrase
  name = Faker::Ancient.god
  photo = Faker::GameOfThrones.character
  description = Faker::GameOfThrones.quote

  # creating an instance of the user
  u = User.create(email: email, password: password, name: name, photo: photo, description: description)
  # Drone Loop
  3.times do
    name = Faker::StarWars.droid
    description = Faker::VForVendetta.quote
    location = Faker::University.name
    photo = Faker::Pokemon.name
    price = rand(20..40)
    d = Drone.new(name: name, description: description, location: location, photo: photo, price: price)
    d.user = u
    d.save
    # Booking Loop
    2.times do
      status = "pending"
      start_date = Time.now
      end_date = Time.parse ("Aug #{rand(1..31)} 2018")
      b = Booking.create(user: u, drone: d, status: status, start_date: start_date, end_date: end_date)
    end
  end
end

puts 'completed'
