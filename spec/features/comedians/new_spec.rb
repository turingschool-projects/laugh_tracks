require 'rails_helper'

describe "When I visit new_comedian_path" do
  describe "Fill out the form with comedian data" do
    it "I am redirected to comedians_path and new comedian is listed" do
      comedian = Comedian.create(name: "Bill Hicks", age: 55, birthplace: "Denver, CO", image_url: "www.google.com")

      visit comedians_path
      click_link "Add a Comedian"

      expect(current_path).to eq(new_comedian_path)

      fill_in 'comedian[name]', with: comedian.name
      fill_in 'comedian[age]', with: comedian.age
      fill_in 'comedian[birthplace]', with: comedian.birthplace
      click_on "Submit"

      updated_comedian = Comedian.last

      expect(current_path).to eq(comedians_path)

      expect(page).to have_content(updated_comedian.name)
      expect(page).to have_content("Age #{updated_comedian.age}")
      expect(page).to have_content("Born in #{updated_comedian.birthplace}")
    end
  end
end
