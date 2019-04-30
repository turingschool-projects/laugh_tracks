require 'rails_helper.rb'

RSpec.describe 'comedians index page' do

  it 'shows comedians' do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")

    visit '/comedians'

    within "#1" do
      have_content(comedian_1.age)
    end

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_1.age)
    expect(page).to have_content(comedian_1.birthplace)
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content(comedian_2.age)
    expect(page).to have_content(comedian_2.birthplace)

  end

end
