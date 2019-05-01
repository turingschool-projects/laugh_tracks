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

  # it "shows specials under comedian with name and runtime" do
  #   comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
  #   comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")
  #   special_1 = Special.create(name: "Walk Your Way Out", runtime_mins: 77, comedian_id: comedian_1.id)
  #   special_2 = Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: comedian_1.id)
  #   special_3 = Special.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2)
  #
  #   within "##{comedian_1.id}" do
  #     expect(page).to have_content(special_1.name)
  #     expect(page).to have_content(special_1.runtime_mins)
  #     expect(page).to have_content(special_2.name)
  #     expect(page).to have_content(special_2.runtime_mins)
  #   end
  #
  #   within "##{comedian_2}" do
  #     expect(page).to have_content(special_3.name)
  #     expect(page).to have_content(special_3.runtime_mins)
  #   end
  #
  # end

end
