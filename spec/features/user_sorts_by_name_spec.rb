# As a user, when I visit `/comedians?sort=name`
# Then I see all previous information, but all comedians are
# sorted alphabetically by the name of the comedians.

require "rails_helper"

describe "user sees name-sorted comedians" do
  describe "they visit /comedians?sort=name" do
    it "displays all comedians sorted by name " do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')

      visit '/comedians?sort=name'

      expect(/bob(.|\n)*george/).to match(page.body)


    end
  end
end
