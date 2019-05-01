require "rails_helper"

RSpec.describe "specials index page" do

  before (:each) do
  end

  it "loads a page" do
    visit "/comedians"

    expect(page.status_code).to eq(200)
    expect(current_path).to eq("/comedians")
  end

  it "shows specials information" do
    
  end

end
