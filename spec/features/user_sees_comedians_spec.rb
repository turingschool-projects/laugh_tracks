require 'rails_helper'

RSpec.describe "an unauthenticated user visiting welcome page" do
  it "should see a comedians age, name and city" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    visit '/comedians'

    expect(page).to have_content("Age: #{comedian.age}")
    expect(page).to have_content(comedian.name)
    expect(page).to have_content(comedian.city)
  end

  it "should see comedians speacials and run time" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    special = comedian.specials.create(name: "FOX", runtime_minutes: 30, image_url: "google.com")
    visit '/comedians'

    expect(page).to have_content(special.name)
    expect(page).to have_content(special.runtime_minutes)
    expect(page).to have_xpath('//img[@src="google.com"]')
  end
end
# As a visitor
# When I visit `/comedians`
# Then I also see a list of each comedian's TV specials, including
#   * Name of the special
#   * Run Time of the special in minutes
