require "rails_helper"

describe "user sees all comedians " do
  describe "they visit /comedians" do
    it "displays all comedians with specials" do

      comedian_1 = Comedian.create!(id: 1, name: "Bob", age: 55, city: "Tucson")
      comedian_2 = Comedian.create!(id: 2, name: "Jane", age: 25, city: "Denver")
      special_1 = Special.create!(id:1, name: "Bob one", comedian_id: 'Bob')
      special_1 = Special.create!(id:2, name: "Bob two", comedian_id: 'Bob')
      special_1 = Special.create!(id:3, name: "Jane one", comedian_id: 'Jane')

      visit '/comedians'

      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_2.name)
      expect(page).to have_content(special_3.name)

    end
  end
end
