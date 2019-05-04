require "rails_helper"

describe "user sees age-queried comedians" do
  describe "they visit /comedians?age=22" do
    it "displays all comedians aged 22 " do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')

      visit '/comedians?age=22'
      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.city)
      expect(page).to have_no_content(comedian_2.name)
      expect(page).to have_no_content(comedian_2.age)
      expect(page).to have_no_content(comedian_2.city)

    end
  end
end
