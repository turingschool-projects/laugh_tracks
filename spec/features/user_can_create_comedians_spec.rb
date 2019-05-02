# As a visitor
# When I visit `/comedians/new`
# Then I see a form to input a new comedian into the database
# Including fields for their name, age and city.
# When the form is successfully submitted and saved,
# Then I am redirected to `/comedians`
# And I see the new comedian's data on the page.

require "rails_helper"

describe "user can create a comedian do " do
  describe "when they visit /comedians/new" do
    it "shows a form to input a new comedian" do
      
      visit '/comedians/new'
      require "pry"; binding.pry
      fill_in "comedian[name]", with: "Tom Hanks"
      fill_in "comedian[age]",  with: "22"
      fill_in "comedian[city]",  with: "Denver"
      click_on 'Create Comedian'

      expect(page).to have_content("Tom Hanks")
      expect(page).to have_content("22")
      expect(page).to have_content("Denver")

    end

  end

end
