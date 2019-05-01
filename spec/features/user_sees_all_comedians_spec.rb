require "rails_helper"

describe "user sees all comedians" do
  describe "they visit /comedians" do
    it "displays all comedians" do


      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')

      visit '/comedians'

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.city)
      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.city)

    end
  end
end
