require "rails_helper"

RSpec.describe "user sees all comedians" do

  describe "they visit /comedians" do
    it "displays all comedians" do
      comedian_1 = Comedian.create!(name: "Corn Dog", age: 25, city: "Washington D.C.")
      comedian_2 = Comedian.create!(name: "Chris Davis", age: 25, city: "Texas $")

      visit '/comedians'

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_2.name)
    end

    it "displays the comedian's specials" do
      comedian_1 = Comedian.create!(name: "Corn Dog", age: 25, city: "Washington D.C.")
      comedian_2 = Comedian.create!(name: "Chris Davis", age: 25, city: "Texas $")

      special_1 = comedian_1.specials.create(name: "Corn Dog Live", run_time: 60)
      special_2 = comedian_1.specials.create(name: "Corn Dog Live Again", run_time: 62)
      special_3 = comedian_1.specials.create(name: "Corn Dog Taped Previously Again", run_time: 61)
      special_4 = comedian_2.specials.create(name: "CD: Live at MSG", run_time: 50)

      visit '/comedians'

      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_2.name)
      expect(page).to have_content(special_3.name)
      expect(page).to have_content(special_4.name)
    end

    # User Story 4
    # As a visitor
    # When I visit `/comedians?age=34`
    # Then I see the list of comedians on the page only shows
    # comedians who match the age criteria.
    #
    # - All other information on the page is still expected to be present
    # - Testing should check that excluded comedians do not show up.
    it "displays the comedian(s) who are a given age" do
      comedian_1 = Comedian.create!(name: "Corn Dog", age: 25, city: "Washington D.C.")
      comedian_2 = Comedian.create!(name: "Chris Davis", age: 35, city: "Texas $")

      special_1 = comedian_1.specials.create(name: "Corn Dog Live", run_time: 60)
      special_2 = comedian_1.specials.create(name: "Corn Dog Live Again", run_time: 62)
      special_3 = comedian_1.specials.create(name: "Corn Dog Taped Previously Again", run_time: 61)
      special_4 = comedian_2.specials.create(name: "CD: Live at MSG", run_time: 50)

      visit '/comedians?age=25'

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to_not have_content(comedian_2.name)
    end

    # User Story 5
    # As a visitor
    # When I visit `/comedians`
    # For each comedian, I see a count of their TV specials
    it "displays number of specials each comedian has" do
      comedian_1 = Comedian.create!(name: "Corn Dog", age: 25, city: "Washington D.C.")
      comedian_2 = Comedian.create!(name: "Chris Davis", age: 35, city: "Texas $")

      special_1 = comedian_1.specials.create(name: "Corn Dog Live", run_time: 60)
      special_2 = comedian_1.specials.create(name: "Corn Dog Live Again", run_time: 62)
      special_3 = comedian_1.specials.create(name: "Corn Dog Taped Previously Again", run_time: 61)
      special_4 = comedian_2.specials.create(name: "CD: Live at MSG", run_time: 50)

      visit '/comedians'

      within "#comedian-#{comedian_1.id}" do
        expect(page).to have_content "Number of specials: 3"
      end

      within "#comedian-#{comedian_2.id}" do
        expect(page).to have_content "Number of specials: 1"
      end
    end

    

  end
end
