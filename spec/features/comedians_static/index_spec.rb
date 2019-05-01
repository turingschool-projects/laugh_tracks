require "rails_helper"

RSpec.describe "comedian index page", type: :feature do

  before(:each) do
    @comedian_1 = Comedian.new(name: "John Mulany", age: 37, city: "Chicago")
    @comedian_2 = Comedian.new(name: "Mitchell Hedberg", age: 37, city: "Saint Paul")
  end

  it "loads a page" do
    visit "/comedians"

    expect(page.status_code).to eq(200)
    expect(current_path).to eq("/comedians")
  end

  it "shows comedian demographics" do
    visit "/comedians"

    #unsure of final layout, will target once design is complete.
    # within("div#comedian_list") do
      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.city)
      expect(page).to have_content(@comedian_2.name)
      expect(page).to have_content(@comedian_2.age)
      expect(page).to have_content(@comedian_2.city)
    # end

  end

#   User Story 1
#
# As a visitor
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age
#   * City
#
# - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
# - The city attribute can hold birthplace or current known hometown.
# - For testing, you should ensure that the name, age and city only appear on a
#   specific area of the page for that single comedian.
end
