require "rails_helper"

RSpec.describe "a vistor visiting the players path" do

  it "should see a list of players" do 
    player_1 = Player.create(name: "Joe", age: 31, hometown: "Springfield, MA")
    player_2 = Player.create(name: "Jesse", age:41, hometown: "Galaxy, One")

    visit '/players'

    expect(page).to have_content("Joe")
    expect(page).to have_content("31")
    expect(page).to have_content("Hometown: Springfield, MA")
    expect(page).to have_content("Jesse")
  end
end
