require 'rails_helper.rb'

RSpec.describe 'comedians index page' do

  it 'shows comedians' do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")

    visit '/comedians'

    within "##{comedian_1.id}" do
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.birthplace)
    end

    within "##{comedian_2.id}" do
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
    end

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_2.name)

  end

  it "shows specials under comedian with name and runtime" do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")
    comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77)
    comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80)
    comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63)

    visit '/comedians'

    save_and_open_page
    within "##{comedian_1.id}" do
      expect(page).to have_content(comedian_1.specials.first.name)
      expect(page).to have_content(comedian_1.specials.first.runtime_mins)
      expect(page).to have_content(comedian_1.specials.last.name)
      expect(page).to have_content(comedian_1.specials.last.runtime_mins)
    end

    within "##{comedian_2.id}" do
      expect(page).to have_content(comedian_2.specials.first.runtime_mins)
      expect(page).to have_content(comedian_2.specials.first.runtime_mins)
    end

  end

end
