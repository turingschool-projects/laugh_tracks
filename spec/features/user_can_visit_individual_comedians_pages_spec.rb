# As a user, when I visit `/comedians`,
# I see all previous information
# And each comedian's name is a link to a page that only shows
# that comedian's information and TV specials.
#
# For example, comedian #4 in your database would have a page like
# `/comedians/4`
#
# - Testing should check that only this one comedian's information
#   is on the page.

require "rails_helper"

describe "user sees one comedian" do
  describe "they link from the comedians index" do
    it "displays information for one comedian" do
      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      visit '/comedians'
      click_link comedian_1.name

      # expect(current_path).to eq("/comedians/#{comedian.id}")
require "pry"; binding.pry
      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.city)
      expect(page).to_not have_content(comedian_2.name)
      expect(page).to_not have_content(comedian_2.age)
      expect(page).to_not have_content(comedian_2.city)
    end
  end
end
