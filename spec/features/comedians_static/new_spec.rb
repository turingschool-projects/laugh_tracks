require "rails_helper"

RSpec.describe "When I visit /comedians/new" do
  describe "I see a form to add a new comedian into the database" do
    it "loads a page" do
      visit "/comedians/new"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/comedians/new")
    end
  end
end
