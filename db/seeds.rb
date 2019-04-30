# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



comedian_list = [
  [ 1, "George", 18, "Memphis", "https://www.pexels.com/photo/grey-and-white-short-fur-cat-104827/"],
  [ 2, "Bill", 22, "Albuquerque"],
  [ 3, "Kate", 33, "Tucson"],
  [ 4, "Jane", 45, "Salt Lake City"]
]

special_list = [
  [ 1, "George in Utah", 1],
  [ 2, "Bill", 2 ],
  [ 3, "Kate in France", 3],
  [ 4, "Jane in Alabama", 4],
  [ 5, "Jane in Austin", 4],
  [ 6, "Bill in England", 2],
  [ 7, "Kate Never Stops", 33],
  [ 8, "Jane's Best", 4]
]
comedian_list.each do | id, name, age, city, image|
  Comedian.create( id: id, name: name, age: age, city: city, image: image )
end

special_list.each do |id, name, comedian_id|
  Special.create( id: id, name: name, comedian_id: comedian_id)
end
