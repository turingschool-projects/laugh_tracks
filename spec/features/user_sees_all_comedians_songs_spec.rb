require "rails_helper"

describe "user sees all comdeians" do
  describe "they visit /articles" do
    it "displays all articles" do
      comedian = Comedian.create(name: "Bill Burr", age: 50, city: "Canton, MA", image: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")

       spec_1 = Special.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
       spec_2 = Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: 1, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")

      visit '/comedians'
      within '#comedian-1' do
        expect(page).to have_content(spec_1.name)
        expect(page).to have_content(spec_1.runtime_mins)
      end
      within '#comedian-2' do
        expect(page).to have_content(spec_2.name)
        expect(page).to have_content(spec_2.runtime_mins)
      end
    end
  end
end
