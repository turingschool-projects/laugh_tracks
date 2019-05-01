require "rails_helper"

describe "user sees all comedians" do
  describe "they visit /comedians" do
    it "displays all comedians" do
      comedian_1 = Comedian.create!(name: "Corn Dog", age: 25, city: "Washington D.C.")
      comedian_2 = Comedian.create!(name: "Chris Davis", age: 25, city: "Texas $")

      visit '/comedians'

      expect(page).to have_content(comedian_1.name)
     expect(page).to have_content(comedian_2.name)
    end
  end
end
