require 'rails_helper'

RSpec.describe "as a user on the new comedian page", type: :feature do

  describe "I see a form for a new comedian" do
    it "shows the comedians name age and birthplace fields" do

      visit '/comedians/new'

      #expect to see place for name, age, city
      expect(page).to have_content("Name")
      expect(page).to have_content("Age")
      expect(page).to have_content("Birthplace")
      expect(page).to have_button("Create Comedian")

      # When the form is successfully submitted and saved,
      # Then I am redirected to `/comedians`
      # And I see the new comedian's data on the page.
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
