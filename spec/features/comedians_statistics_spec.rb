require 'rails_helper'

RSpec.describe "as a user to the comedian statistics page", type: :feature do
  before :each do
    @comedian_1 = Comedian.create(name:"Maria Bamford", age: 49,  birthplace: "Port Hueneme, CA", thumb_url: "http://pixel.nymag.com/imgs/daily/vulture/2016/02/23/23-maria-bamford.w1200.h630.jpg")

    @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 49, birthplace: "Washington, D.C.", thumb_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

    @comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", thumb_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")

    @comedians = Comedian.all
  end

  it "displays an area at the top of the page called 'Statistics'" do
    visit '/comedians'
    expect(page).to have_content("Statistics")
  end

  it "shows the average age of all comedians on the page" do
    visit '/comedians'
    expect(page).to have_content("#{@comedians.average_age}")
  end

  xit "displays a unique list of cities for each comedian on the page" do
    visit '/comedians'
    expect(page).to have_content("#{@comedians.display_cities}")
  end
end
