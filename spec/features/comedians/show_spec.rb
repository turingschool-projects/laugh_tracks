require 'rails_helper'

describe "Comedian Show Page" do
  before :each do
    @comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
    @comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.maxim.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_1400/MTQ4NDk2MjMzNzY0MjM0Nzc2/joe-rogan.webp")

    @special_1 = @comedian_1.specials.create(name: "Bill Burr Special", runtime_mins: 55, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
    @special_2 = @comedian_1.specials.create(name: "Bill Burr Special 2", runtime_mins: 60, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")
    @special_3 = Special.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))
    @special_4 = Special.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))
  end
  describe "When I visit a comedian show page" do
    it "only shows that comedian's information and TV specials." do

      visit comedian_path(@comedian_2)

      within("#com-info") do
      expect(page).to have_content(@comedian_2.name)
      expect(page).to have_content("Age #{@comedian_2.age}")
      expect(page).to have_content("Born in #{@comedian_2.birthplace}")
      end
      within("#special-#{@special_3.id}") do
      expect(page).to have_content(@special_3.name)
      expect(page).to have_content(@special_3.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg"]')
      end
      within("#special-#{@special_4.id}") do
      expect(page).to have_content(@special_4.name)
      expect(page).to have_content(@special_4.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg"]')
      end
    end
  end
end
