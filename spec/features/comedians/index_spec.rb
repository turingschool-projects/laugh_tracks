require "rails_helper"

RSpec.describe "comedians index page", type: :feature do

  # As a user,
  # when I visit '/comedians'
  # Then I see a list of comedians with name, age, and city

  it "user can see all comedians" do
    andy = Comedian.create(name: "Andy Kauffman", age: 35, city: "New York, NY")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL")

    visit "/comedians"

    expect(page).to have_content(andy.name)
    expect(page).to have_content("(#{andy.age} years old) #{andy.city}")
    expect(page).to have_content(brian.name)
    expect(page).to have_content("(#{brian.age} years old) #{brian.city}")
  end


end
