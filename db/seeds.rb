# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all

Player.create(name: "Justin D",  age: 31, hometown:"Florida",image:"https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")
Player.create(name: "Kurumi D",  age: 31, hometown:"Okinawa", image:"https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")

