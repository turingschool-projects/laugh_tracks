# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

band_1 = Band.create(name: "The Bombpops", city: "San Diego", age: 10)
album_1 = band_1.albums.create(name: "Dear Beer", track_count: 4)
album_2 = band_1.albums.create(name: "Fear of Missing Out", track_count: 13)

band_2 = Band.create(name: "Bad Cop Bad Cop", city: "San Pedro", age: 8)
album_5 = band_2.albums.create(name: "Boss Lady", track_count: 4)
album_6 = band_2.albums.create(name: "Warriors", track_count: 4)
