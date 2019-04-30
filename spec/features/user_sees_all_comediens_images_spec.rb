require "rails_helper"

describe "user sees all comedians images " do
  describe "they visit /comedians" do
  it "displays all comedians with images" do
    comedian_1 = Comedian.create!(name: "Bob", age: 55, city: "Tucson", image: "https://m.media-amazon.com/images/M/MV5BMTUyMDY4OTYxMl5BMl5BanBnXkFtZTgwMDU5MzczMTE@._V1_SX799_CR0,0,799,999_AL_.jpg")
    comedian_2 = Comedian.create!(name: "Jane", age: 25, city: "Denver", image:"https://m.media-amazon.com/images/M/MV5BOTM2MWIwMGItYzZjYi00OGIyLTk2ZjgtZDg5OGRkNzliODJlXkEyXkFqcGdeQXVyMTczMDg0MTY@._V1_SY1000_CR0,0,1369,1000_AL_.jpg" )

    visit '/comedians'
save_and_open_page
    expect(page).to have_xpath("//img[@src = 'https://m.media-amazon.com/images/M/MV5BMTUyMDY4OTYxMl5BMl5BanBnXkFtZTgwMDU5MzczMTE@._V1_SX799_CR0,0,799,999_AL_.jpg']")
    expect(page).to have_xpath("//img[@src = 'https://m.media-amazon.com/images/M/MV5BOTM2MWIwMGItYzZjYi00OGIyLTk2ZjgtZDg5OGRkNzliODJlXkEyXkFqcGdeQXVyMTczMDg0MTY@._V1_SY1000_CR0,0,1369,1000_AL_.jpg']")


  end
end
end
