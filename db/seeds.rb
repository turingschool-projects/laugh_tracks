# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all

p1 = Player.create(name: "Justin D",  age: 31, hometown:"Florida",image:"https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")

p2 =Player.create(name: "Kurumi D",  age: 33, hometown:"Okinawa", image:"https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")

p3 = Player.create(name: "Billham", age:26, hometown:"Miami", image:"https://images1.miaminewtimes.com/imager/u/745xauto/11163483/brian-flores-credit-miami-dolphins.jpg")

p4 = Player.create(name: "Stella", age:19, hometown:"Colorado Springs", image:"https://is4-ssl.mzstatic.com/image/thumb/Video/64/fa/f5/dj.ltuxtuaa.jpg/268x0w.jpg")

p1.cards.create(name:"Black Lotus",cost: 60,description:"The darkest lotus of them all")
p1.cards.create(name:"Grow",cost: 45,description: "Become the biggest in the world")

p2.cards.create(name:"Mist", cost:80, description:"Opponents are unable to directly attack you")

p3.cards.create(name:"Unending Worm", cost:75, description:"Keeps you skinny")
p3.cards.create(name:"Blue Eyes Black Dragon", cost:99, description: "Best Dragon")
p3.cards.create(name:"Accompany", cost: 0, description:"Takes players to another player")
p3.cards.create(name:"Magnetic Force", cost: 30, description:"Takes you to another player")

p4.cards.create(name:"Get Groove Back", cost: 9999, description: "Gets ones groove back")
p4.cards.create(name:"Protect Groove", cost:99, description: "Prevents ones groove from being taken")
