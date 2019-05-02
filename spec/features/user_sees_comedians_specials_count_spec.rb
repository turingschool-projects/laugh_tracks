require "rails_helper"

describe "user sees all comedians" do
  describe "they visit /comedians" do
    it "displays all comedians" do


      bill = Comedian.create(name: "Bill Burr", age: 50, city: "Canton, MA", image: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      joe = Comedian.create(name: "Joe Rogan", age: 51, city: "Newark, NJ", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")
      Special.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: bill.id, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
      Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: bill.id, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
      Special.create(name: "You People Are All The Same", runtime_mins: 69, comedian_id: bill.id, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      Special.create(name: "Strange Times", runtime_mins: 63, comedian_id: joe.id, image_url: "https://m.media-amazon.com/images/M/MV5BNzc2Mzg5YmMtMzM1NC00NDgwLTljYWQtZDdkNzBmNjZkNmJhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
      Special.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg")

      visit '/comedians'

      within "#comedian-#{bill.id}" do
        expect(page).to have_content('3')
      end
      within "#comedian-#{joe.id}" do
        expect(page).to have_content('1')
      end

    end
  end
end
