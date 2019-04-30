require 'rails_helper'

describe "Comedians index page" do
  describe "When I visit /comedians" do
    it "Shows name, age and birthplace for each comedian" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 52, birthplace: "Denver", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bill_Burr_by_Gage_Skidmore.jpg/220px-Bill_Burr_by_Gage_Skidmore.jpg" )
      comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 60, birthplace: "Queens NY", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")

      visit comedians_path

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content("Age #{comedian_1.age}")
      expect(page).to have_content("Born in #{comedian_1.birthplace}")

      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
    end
    it "I see a list of each comedians specials, name, and runtime" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 52, birthplace: "Denver", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bill_Burr_by_Gage_Skidmore.jpg/220px-Bill_Burr_by_Gage_Skidmore.jpg" )
      comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 60, birthplace: "Queens NY", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")

      special_1 = comedian_1.specials.create(name: "Bill Burr Special", runtime_mins: 55, image_url: "https://m.media-amazon.com/images/M/MV5BMjI3OTcxNTA1MV5BMl5BanBnXkFtZTgwNDY2MjA2MDE@._V1_UX182_CR0,0,182,268_AL_.jpg")
      special_2 = comedian_1.specials.create(name: "Bill Burr Special 2", runtime_mins: 60, image_url: "https://m.media-amazon.com/images/M/MV5BMjI3OTcxNTA1MV5BMl5BanBnXkFtZTgwNDY2MjA2MDE@._V1_UX182_CR0,0,182,268_AL_.jpg")

      special_3 = comedian_2.specials.create(name: "Jerry Seinfeld Special", runtime_mins: 40, image_url: "https://m.media-amazon.com/images/M/MV5BMjI3OTcxNTA1MV5BMl5BanBnXkFtZTgwNDY2MjA2MDE@._V1_UX182_CR0,0,182,268_AL_.jpg")
      special_4 = comedian_2.specials.create(name: "Jerry Seinfeld Special 2", runtime_mins: 68, image_url: "https://m.media-amazon.com/images/M/MV5BMjI3OTcxNTA1MV5BMl5BanBnXkFtZTgwNDY2MjA2MDE@._V1_UX182_CR0,0,182,268_AL_.jpg")

      visit comedians_path

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content("Age #{comedian_1.age}")
      expect(page).to have_content("Born in #{comedian_1.birthplace}")
      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_1.runtime_mins)
      expect(page).to have_content(special_2.name)
      expect(page).to have_content(special_2.runtime_mins)

      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
      expect(page).to have_content(special_3.name)
      expect(page).to have_content(special_3.runtime_mins)
      expect(page).to have_content(special_4.name)
      expect(page).to have_content(special_4.runtime_mins)
    end
    it "there is a thumbnail image for each comedian" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 52, birthplace: "Denver", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg" )
      comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 60, birthplace: "Queens NY", image_url: "https://www.gannett-cdn.com/-mm-/aec403ad632f33650ec1aa7926a673a5a6b987b8/c=420-0-2149-1300/local/-/media/2015/09/17/Westchester/Westchester/635780965457520146--ASBBrd-07-27-2012-PressMon-1-A002-2012-07-26-IMG-People-Seinfeld-7-1-4U1UD.jpg?width=534&height=401&fit=crop")

      visit comedians_path

      expect(page).to have_xpath(img[src*=comedian_1.image_url])
      expect(page).to have_xpath(img[src*=comedian_2.image_url])
    end
  end
end
