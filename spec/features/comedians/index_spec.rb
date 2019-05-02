require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  it "user can see all comedians" do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ")

    visit "/comedians"

    expect(page).to have_content(comedian_1.name)
    #expect(page).to have_content("Bill Burr")
    expect(page).to have_content(comedian_2.name)
    #expect(page).to have_content("Joe Rogan")
  end
end
