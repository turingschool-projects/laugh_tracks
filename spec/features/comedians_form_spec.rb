require 'rails_helper'

RSpec.describe "as a user on the new comedian page", type: :feature do
  before :each do
    @comedian_1 = Comedian.create(name:"Maria Bamford", age: 49,  birthplace: "Port Hueneme, CA", thumb_url: "http://pixel.nymag.com/imgs/daily/vulture/2016/02/23/23-maria-bamford.w1200.h630.jpg")

    @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 49, birthplace: "Washington, D.C.", thumb_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

    @comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", thumb_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
  end
  
  describe "I see a form for a new comedian" do
    it "shows the comedians name age and birthplace fields" do

      visit '/comedians/new'

      #expect to see place for name, age, city
      expect(page).to have_content("Name")
      expect(page).to have_content("Age")
      expect(page).to have_content("Birthplace")
      expect(page).to have_button("Create Comedian")
    end

    it "successfully accepts, saves, and redirects upon submission" do
      visit '/comedians/new'

      fill_in 'comedian[name]', with: "Mills"
      fill_in 'comedian[age]', with: 36
      fill_in 'comedian[birthplace]', with: "Pearl River, LA"

      click_button "Create Comedian"

      expect(current_path).to eq('/comedians')

      @new_comedian = Comedian.last
      within("#Comedian-#{@new_comedian.id}") do
        expect(page).to have_content(@new_comedian.name)
      end
    end
  end
end
