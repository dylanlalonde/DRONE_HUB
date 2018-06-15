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
    20.times do
      name = Faker::StarWars.droid
      description = Faker::VForVendetta.quote
      location = Faker::Address.full_address
      photo_url = [
        "https://res.cloudinary.com/greggstyle/image/upload/v1528901013/Drone/1.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1528901013/Drone/2.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1528901013/Drone/3.png",
        "https://res.cloudinary.com/greggstyle/image/upload/v1528901013/Drone/4.png",
        "https://res.cloudinary.com/greggstyle/image/upload/v1528901013/Drone/5.png",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/perrot-bebop.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/yuneec-typhoon.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/hubsan.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/parrot-mambo.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/hexa.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/syma-x20.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/freeflyh.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/fpv-fv.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071622/Drone/dji-phantom.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071622/Drone/dji-inspire.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071622/Drone/dji-phantom-pro.jpg",
        "https://res.cloudinary.com/greggstyle/image/upload/v1529071632/Drone/perrot-bebop.jpg"
      ].sample
      price = rand(50..200)
      category = ["Delivery", "Military", "Agriculture", "Racing", "Sport", "Photography", "Medical", "Communications"].sample
      d= Drone.new({name: name, description: description, location: location, remote_photo_url: photo_url, price:price, category:category})
      d.user = u
      d.save
      # Booking Loop
      1.times do
        status = "pending"
        start_date = Time.now
        end_date = Time.parse ("Aug #{rand(1..31)} 2018")
        b = Booking.create(user: u, drone: d, status: status, start_date: start_date, end_date: end_date)
      end
    end
  end

  puts 'completed'

  #upload 10 pictures to cloudinary, then make an array of their names, then have the seed file pick randomly on their name.


