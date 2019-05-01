require 'rails_helper'

describe Comedian, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
    it {should validate_presence_of(:image_url)}
  end
end


  # Pending:
  #   Comedian is not valid without a name
  #     # Not yet implemented
  #   Comedian is not valid without a age
  #     # Not yet implemented
  #   Comedian is not valid without a birthplace
  #     # Not yet implemented
  #   Comedian is not valid without a image_url
  #     # Not yet implemented




  # it "user can see /comedians" do
  #   comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
  #   comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")
  #   comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
  #
  #   # special_1 = Special.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
  #   # special_2 = Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
  #   # special_3 = Special.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
  #   # special_4 = Special.create(name: "Strange Times", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
  #   # special_5 = Special.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")
  #   # special_6 = Special.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg")
  #   # special_7 = Special.create(name: "Oh My God", runtime_mins: 58, comedian_id: 3, image_url: "https://m.media-amazon.com/images/M/MV5BMjQ4NjQwOTYzNl5BMl5BanBnXkFtZTcwNjU2NjczOQ@@._V1_.jpg")
  #   # special_8 = Special.create(name: "Live At The Beacon Theater", runtime_mins: 63, comedian_id: 3, image_url: "https://m.media-amazon.com/images/M/MV5BNzIxMTUxMjYzMV5BMl5BanBnXkFtZTcwMDYwMjE0Nw@@._V1_.jpg")
  #   # special_9 = Special.create(name: "Hilarious", runtime_mins: 88, comedian_id: 3, image_url: "https://m.media-amazon.com/images/M/MV5BNTQyODYyNzcxN15BMl5BanBnXkFtZTgwOTA3MzcwMzE@._V1_.jpg")
  #
  #   visit '/comedians'
  #
  #   expect(page).to have_content(comedian_1.name)
  #   expect(page).to have_content(comedian_1.age)
  #   expect(page).to have_content(comedian_1.birthplace)
  #   expect(page).to have_content(comedian_1.image_url)
  #
  #   expect(page).to have_content(comedian_2.name)
  #   expect(page).to have_content(comedian_2.age)
  #   expect(page).to have_content(comedian_2.birthplace)
  #   expect(page).to have_content(comedian_2.image_url)
  #
  #   expect(page).to have_content(comedian_3.name)
  #   expect(page).to have_content(comedian_3.age)
  #   expect(page).to have_content(comedian_3.birthplace)
  #   expect(page).to have_content(comedian_3.image_url)
  #
  #
  #   expect(page).to have_content(special_1.name)
  #   expect(page).to have_content(special_1.runtime_mins)
  #   expect(page).to have_content(special_1.comedian_id)
  #   expect(page).to have_content(special_1.image_url)
  #
  #   expect(page).to have_content(special_2.name)
  #   expect(page).to have_content(special_2.runtime_mins)
  #   expect(page).to have_content(special_2.comedian_id)
  #   expect(page).to have_content(special_2.image_url)
  #
  # end
