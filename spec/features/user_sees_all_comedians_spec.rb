require "rails_helper"

describe "user sees all " do
  describe "they visit /comedians" do
    it "displays all comedians" do

      comedian_1 = Comedian.create!(id: 1, name: "Bob", age: 55, city: "Tucson")
      comedian_1 = Comedian.create!(id: 2, name: "Jane", age: 25, city: "Denver")

      visit '/comedians'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
      expect(page).to have_link("Create a New Article")

    end
  end
end
