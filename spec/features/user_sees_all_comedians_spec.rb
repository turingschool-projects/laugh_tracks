require "rails_helper"

describe "user sees all comdeians" do
  describe "they visit /articles" do
    it "displays all articles" do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')

      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
      expect(page).to have_link("Create a New Article")

    end
  end
end
