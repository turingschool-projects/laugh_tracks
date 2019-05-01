require 'rails_helper'

describe "Comedians index page" do
  before :each do
  @comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
  @comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 64, birthplace: "Brooklyn, NY", image_url: "https://www.gannett-cdn.com/-mm-/aec403ad632f33650ec1aa7926a673a5a6b987b8/c=420-0-2149-1300/local/-/media/2015/09/17/Westchester/Westchester/635780965457520146--ASBBrd-07-27-2012-PressMon-1-A002-2012-07-26-IMG-People-Seinfeld-7-1-4U1UD.jpg?width=534&height=401&fit=crop")
  @comedian_3 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.maxim.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_1400/MTQ4NDk2MjMzNzY0MjM0Nzc2/joe-rogan.webp")
  @comedian_4 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")

  @special_1 = @comedian_1.specials.create(name: "Bill Burr Special", runtime_mins: 55, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
  @special_2 = @comedian_1.specials.create(name: "Bill Burr Special 2", runtime_mins: 60, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")

  @special_3 = @comedian_2.specials.create(name: "Jerry Seinfeld Special", runtime_mins: 40, image_url: "https://m.media-amazon.com/images/M/MV5BODMyZjU2NWQtMTI2ZC00Y2ZkLTllYjItNjNiM2Y1NTIyMmIyXkEyXkFqcGdeQXVyNjYzMDA4MTI@._V1_.jpg")
  @special_4 = @comedian_2.specials.create(name: "Jerry Seinfeld Special 2", runtime_mins: 68, image_url: "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_.jpg")

  @special_5 = Special.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))
  @special_6 = Special.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))

  @special_7 = Special.create(name: "Hilarious", runtime_mins: 88, image_url: "https://m.media-amazon.com/images/M/MV5BNTQyODYyNzcxN15BMl5BanBnXkFtZTgwOTA3MzcwMzE@._V1_.jpg", comedian: Comedian.find_by(name: "Louis C.K."))
  end
  describe "When I visit /comedians" do
    it "Shows name, age and birthplace for each comedian" do

      visit comedians_path

      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content("Age #{@comedian_1.age}")
      expect(page).to have_content("Born in #{@comedian_1.birthplace}")

      expect(page).to have_content(@comedian_2.name)
      expect(page).to have_content("Age #{@comedian_2.age}")
      expect(page).to have_content("Born in #{@comedian_2.birthplace}")
    end
    it "I see a list of each comedians specials, name, runtime and image" do


      visit comedians_path


      expect(page).to have_content(@special_1.name)
      expect(page).to have_content(@special_1.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg"]')
      expect(page).to have_content(@special_2.name)
      expect(page).to have_content(@special_2.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg"]')


      expect(page).to have_content(@special_3.name)
      expect(page).to have_content(@special_3.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BODMyZjU2NWQtMTI2ZC00Y2ZkLTllYjItNjNiM2Y1NTIyMmIyXkEyXkFqcGdeQXVyNjYzMDA4MTI@._V1_.jpg"]')
      expect(page).to have_content(@special_4.name)
      expect(page).to have_content(@special_4.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_.jpg"]')
    end
    it "there is a thumbnail image for each comedian" do

      visit comedians_path

      expect(page).to have_xpath('//img[@src="https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg"]')
      expect(page).to have_xpath('//img[@src="https://www.gannett-cdn.com/-mm-/aec403ad632f33650ec1aa7926a673a5a6b987b8/c=420-0-2149-1300/local/-/media/2015/09/17/Westchester/Westchester/635780965457520146--ASBBrd-07-27-2012-PressMon-1-A002-2012-07-26-IMG-People-Seinfeld-7-1-4U1UD.jpg?width=534&height=401&fit=crop"]')
    end
    it "I can filter comedians on the page by age" do

      visit comedians_path

      within("#age-#{@comedian_1.id}") do
      expect(page).to have_link(@comedian_1.age)
      end
      within("#age-#{@comedian_2.id}") do
      expect(page).to have_link(@comedian_2.age)
      end
      within("#age-#{@comedian_3.id}") do
      expect(page).to have_link(@comedian_3.age)
      end
      within("#age-#{@comedian_4.id}") do
      click_link(@comedian_4.age)
      end
      expect(current_path).to eq(comedian_age_path(@comedian_4.age))

      expect(page).to have_content(@comedian_3.name)
      expect(page).to have_content("Age #{@comedian_3.age}")
      expect(page).to have_content("Born in #{@comedian_3.birthplace}")

      expect(page).to have_content(@special_5.name)
      expect(page).to have_content(@special_5.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg"]')
      expect(page).to have_content(@special_6.name)
      expect(page).to have_content(@special_6.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg"]')


      expect(page).to have_content(@comedian_4.name)
      expect(page).to have_content("Age #{@comedian_4.age}")
      expect(page).to have_content("Born in #{@comedian_4.birthplace}")

      expect(page).to have_content(@special_7.name)
      expect(page).to have_content(@special_7.runtime_mins)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BNTQyODYyNzcxN15BMl5BanBnXkFtZTgwOTA3MzcwMzE@._V1_.jpg"]')
    end
    it "displays a count of tv specials for each comedian" do

      visit comedians_path

      within("#specials-#{@comedian_1.id}") do
      expect(page).to have_content("Special count: 2")
      end
      within("#specials-#{@comedian_2.id}") do
      expect(page).to have_content("Special count: 2")
      end
      within("#specials-#{@comedian_3.id}") do
      expect(page).to have_content("Special count: 2")
      end
      within("#specials-#{@comedian_4.id}") do
      expect(page).to have_content("Special count: 1")
      end
    end
  end
end


# - All other information on the page is still expected to be present
