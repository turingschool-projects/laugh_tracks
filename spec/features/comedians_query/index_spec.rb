require "rails_helper"

RSpec.describe "As a visitor" do

  before(:each) do
    @comedian_1 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago", \
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCCUVWI5B-6-80aviR_4WtoJqCsu33NEKB18j_xZ7UT4WpWhQa")
    @comedian_2 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul", \
    image: "https://pixel.nymag.com/imgs/daily/vulture/2018/05/02/02-john-mulaney.w700.h700.jpg")
    @comedian_3 = Comedian.create(name: "George Carlin", age: 71, city: "Manhattan", \
    image: "https://pixel.nymag.com/imgs/daily/vulture/2018/09/23/1-George-Carlin.w330.h330.jpg")
  end

  describe "when I visit /comidians?age=71" do
    it "loads a page" do
      visit "/comedians?age=71"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/comedians")
    end

    it "only shows matching comedians" do
      visit "/comedians?age=71"

      expect(page).to_not have_content(@comedian_1.name)
      expect(page).to_not have_content(@comedian_1.age)
      expect(page).to_not have_content(@comedian_1.city)
      expect(page).to_not have_content(@comedian_2.name)
      expect(page).to_not have_content(@comedian_2.age)
      expect(page).to_not have_content(@comedian_2.city)
      expect(page).to have_content(@comedian_3.name)
      expect(page).to have_content(@comedian_3.age)
      expect(page).to have_content(@comedian_3.city)
    end
  end
end
