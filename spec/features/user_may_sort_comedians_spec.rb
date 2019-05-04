# As a user, when I visit `/comedians?sort=name`
# Then I see all previous information, but all comedians are
# sorted alphabetically by the name of the comedians.

require "rails_helper"

describe "user may see sorted comedians" do
  describe "they visit /comedians?sort=name" do
    it "displays all comedians sorted by name " do
      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      comedian_2 = Comedian.create(name: "xena", age: 39, city: 'Austin')
      visit '/comedians?sort=name'
      expect(/bob(.|\n)*george(.|\n)xena/).to match(page.body)
    end
  end

  describe "they visit /comedians?sort=city" do
    it "displays all comedians sorted by city " do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      comedian_2 = Comedian.create(name: "xena", age: 39, city: 'Detroit')

      visit '/comedians?sort=city'
      # save_and_open_page

      expect(/Austin(.|\n)*Montreal/).to match(page.body)
    end
  end


end
