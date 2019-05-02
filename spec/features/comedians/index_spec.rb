require 'rails_helper'

RSpec.describe "an unauthenticated user visiting welcome page" do
  it "should see a comedians age, name and city" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    visit '/comedians'

    within("#comedian-#{comedian.id}") do
      expect(page).to have_content("Age: #{comedian.age}")
      expect(page).to have_content(comedian.name)
      expect(page).to have_content("Born in: #{comedian.city}")
    end
  end

  it "should see comedians specials and run time" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    special = comedian.specials.create(name: "FOX", runtime_minutes: 30, image_url: "google.com")
    visit '/comedians'

    expect(page).to have_content("TV special: #{special.name}")
    expect(page).to have_content("Run time: #{special.runtime_minutes} minutes")
    expect(page).to have_xpath('//img[@src="google.com"]')
  end

  it "list of comedians by age" do
    comedian_1 = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    comedian_2 = Comedian.create(name: "Paul", age: 34, city: "Denver", image_url: "google.com")
    visit '/comedians?age=34'

    expect(page).to have_content(comedian_2.name)
    expect(page).to_not have_content(comedian_1.name)
  end

  it "should git a count comedians specials" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    special = comedian.specials.create(name: "FOX", runtime_minutes: 30, image_url: "google.com")
    special_2 = comedian.specials.create(name: "ABC", runtime_minutes: 60, image_url: "google.com")
    visit '/comedians'

    expect(page).to have_content("Number of appearances: #{comedian.specials.count}")
  end

end

# As a visitor
# When I visit `/comedians/new`
# Then I see a form to input a new comedian into the database
# Including fields for their name, age and city.
# When the form is successfully submitted and saved,
# Then I am redirected to `/comedians`
# And I see the new comedian's data on the page.
