require "rails_helper"

RSpec.describe "specials index page", type: :feature do

  before (:each) do
    comedian_1 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago")
    comedian_2 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul")
    @special_1 = comedian_1.specials.create(name: "Comedy Central Special", time: 37)
    @special_2 = comedian_1.specials.create(name: "Mitch All Together", time: 43)
    @special_3 = comedian_2.specials.create(name: "Kid Gorgeous at Radio City", time: 65)
    @special_4 = comedian_2.specials.create(name: "The Comeback Kid", time: 62)
    @special_5 = comedian_2.specials.create(name: "New in Town", time: 60)
  end

  it "loads a page" do
    visit "/comedians"

    expect(page.status_code).to eq(200)
    expect(current_path).to eq("/comedians")
  end

  #unsure of final layout, will target once design is complete.
  # within("div#comedian_list") do
  it "shows specials information" do
    visit "/comedians"

    #unsure of final layout, will target once design is complete.
    # within("div#comedian_list") do
      expect(page).to have_content(@special_1.name)
      expect(page).to have_content(@special_1.time)
      expect(page).to have_content(@special_2.name)
      expect(page).to have_content(@special_2.time)
      expect(page).to have_content(@special_3.name)
      expect(page).to have_content(@special_3.time)
      expect(page).to have_content(@special_4.name)
      expect(page).to have_content(@special_4.time)
      expect(page).to have_content(@special_5.name)
      expect(page).to have_content(@special_5.time)
    # end
  end
end
