require 'rails_helper'

RSpec.describe 'comedian index page', type: :feature do
  it 'has comedian info' do
    jerry = Comedian.create(name: "Jerry", age: 50, city: "no idea")
    bob = Comedian.create(name: "Bob", age: 21, city: "some city")
    rob = Comedian.create(name: "Rob", age: 30, city: "different city")

    visit comedians_path

    expect(page).to have_content(jerry.name)
    expect(page).to have_content(jerry.age)
    expect(page).to have_content(jerry.city)
    expect(page).to have_content(bob.name)
    expect(page).to have_content(bob.age)
    expect(page).to have_content(bob.city)
    expect(page).to have_content(rob.name)
    expect(page).to have_content(rob.age)
    expect(page).to have_content(rob.city)
  end
end
