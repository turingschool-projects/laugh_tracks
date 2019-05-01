require "rails_helper"

RSpec.describe "comedian index page", type: :feature do

  before(:each) do
    @comedian_1 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago")
    @comedian_2 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul")
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
end
