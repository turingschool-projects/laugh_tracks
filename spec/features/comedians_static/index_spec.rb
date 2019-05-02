require "rails_helper"

RSpec.describe "comedian index page", type: :feature do

  before(:each) do
    @comedian_1 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago", \
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCCUVWI5B-6-80aviR_4WtoJqCsu33NEKB18j_xZ7UT4WpWhQa")
    @comedian_2 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul", \
    image: "https://pixel.nymag.com/imgs/daily/vulture/2018/05/02/02-john-mulaney.w700.h700.jpg")
  end

  it "loads a page" do
    visit "/comedians"

    expect(page.status_code).to eq(200)
    expect(current_path).to eq("/comedians")
  end

  it "shows comedian demographics" do
    visit "/comedians"

    within("#comedian_#{@comedian_1.id}_info") do
      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.city)
    end
    
    within("#comedian_#{@comedian_2.id}_info") do
      expect(page).to have_content(@comedian_2.name)
      expect(page).to have_content(@comedian_2.age)
      expect(page).to have_content(@comedian_2.city)
    end
  end

  it "shows comedian thumbnail" do
    visit "/comedians"
    within("#comedian_#{@comedian_1.id}_info") do
      actual = find("#comedian_#{@comedian_1.id}_thumbnail")[:src]
      #possible placeholder id
      expect(actual).to eq(@comedian_1.image)
    end
    within("#comedian_#{@comedian_2.id}_info") do
      actual = find("#comedian_#{@comedian_2.id}_thumbnail")[:src]
      #possible placeholder id
      expect(actual).to eq(@comedian_2.image)
    end
  end
end
