require "rails_helper"

RSpec.describe "When I visit /comedians/new" do
  describe "I see a form to add a new comedian into the database" do
    it "loads a page" do
      visit "/comedians/new"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/comedians/new")
    end

    it "has fields for name, age and hometown" do
      visit "/comedians/new"

      expect(page).to have_content("Name")
      expect(page).to have_content("Age")
      expect(page).to have_content("City")
    end

    it "can create a new comedian" do
      visit "/comedians/new"

      fill_in "Name", with: "Bo Burnham"
      fill_in "Age", with: "28"
      fill_in "City", with: "Hamilton"
      click_on "Create Comedian"

      expect(current_path).to eq("/comedians")
      #target this if possible
      expect(page).to have_content("Bo Burnham")
      expect(page).to have_content("Age: 28")
      expect(page).to have_content("Hometown: Hamilton")
    end
  end
end
