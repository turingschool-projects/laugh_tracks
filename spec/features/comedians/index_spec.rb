require "rails_helper"

RSpec.describe "comedians index page", type: :feature do
  it "user can see all comedians" do
    comedian_1 = Comedian.create(name: 'John', age: '33', city: 'Denver')
    comedian_2 = Comedian.create(name: 'Sally', age: '22', city: 'Chicago')
    

    visit "/comedians"

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content("Age: #{comedian_1.age}")
    expect(page).to have_content("City: #{comedian_1.city}")
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content("Age: #{comedian_2.age}")
    expect(page).to have_content("City: #{comedian_2.city}")
  end
end

# User Story 1

# As a visitor
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age
#   * City

# - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
# - The city attribute can hold birthplace or current known hometown.
# - For testing, you should ensure that the name, age and city only appear on a
#   specific area of the page for that single comedian.