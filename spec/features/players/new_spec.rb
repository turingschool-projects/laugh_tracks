require 'rails_helper'

RSpec.describe "A user visiting the /players/new path" do
  attr_reader :player_1, :player_2

before :each do 
  Player.destroy_all

end

  it "should create a new player" do 
    visit '/players/new'
    #save_and_open_page

    fill_in("player_name", :with => "Joel")
    fill_in("player_age", :with => "21")
    fill_in("player_hometown", :with => "Trenton, NJ")
    fill_in("player_image", :with => "http://www.image3.png")
    
    expect(current_path).to eq("/players/new")

    click_button("commit")
    
    expect(current_path).to eq("/players")

    player_3 = Player.last
    expect(page).to have_content(player_3.name)
  end

end
