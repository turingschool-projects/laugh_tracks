require 'rails_helper'

RSpec.describe "A user visiting the /players/new path" do
  attr_reader :player_1, :player_2

before :each do 
  Player.destroy_all

  @player_1 = Player.create!("Joe", 31, "Miami", image: "http:www.image1.png")
  @player_2 = Player.create!("Jane", 30, "Tokyo", image: "http:www.image2.png")
end

  it "should create a new player" do 
    visit '/players/new'

    fill_in("name", :with => "Joel")
    fill_in("age", :with => "21")
    fill_in("hometown", :with => "Trenton, NJ")
    fill_in("image", :with => "http://www.image3.png")
    click_button("submit")
    
    player_3 = Player.last
    expect(page).to have_content(player_3.name)
  end

end
