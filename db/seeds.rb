# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all

Player.create(name: "Justin D",  age: 31, hometown:"Florida")
Player.create(name: "Kurumi D",  age: 31, hometown:"Okinawa")
Player.create(name: "Mio D",     age: 6,  hometown:"Ginowan")

