require 'rails_helper'

RSpec.describe "an unauthenticated user visiting welcome page" do
  it "should see a comedians age, name and city" do
    comedian = Comedian.create(name: "John", age: 24, city: "Denver", image_url: "google.com")
    visit '/comedians'

    expect(page).to have_content(comedian.age)
    expect(page).to have_content(comedian.name)
    expect(page).to have_content(comedian.city)
  end
end
