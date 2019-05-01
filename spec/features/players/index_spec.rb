require "rails_helper"

RSpec.describe "a vistor visiting the players path" do
  attr_reader :player_1, :player_2

  before :each do
    Player.destroy_all
=begin
  ActiveRecord::Base.connection: Gives me access to helpful methods to manipulate
    the database.
    
  reset_pk_sequence!: resets the internal timer of a table that is passed to it as
    as an argument. pk stands for primary key and is what is used to set unique id's
    of a table.

  players: name of the table I want to be manipulated
  
  Why?: While I can interpolate the ids, I enjoy knowing how to make the program
    do what I expect and better understand the internals. I also read I can change 
    the reset strategy to use truncation instead in a config file which is slower 
    but sets the table to a state I expect when inserting values.
=end
    ActiveRecord::Base.connection.reset_pk_sequence! "players"
    
    @player_1 = Player.create(name: "Joe", age: 31, hometown: "Springfield, MA")
    @player_2 = Player.create(name: "Jesse", age:41, hometown: "Galaxy, One")

  end
  
  it "should see a list of players" do 
    visit '/players'
    
    within '#player-1' do
      expect(page).to have_content("Joe")
      expect(page).to have_content("31")
      expect(page).to have_content("Hometown: Springfield, MA")
    end

    within "#player-#{player_2.id}"do
      expect(page).to have_content("Jesse")
      expect(page).to have_content("41")
      expect(page).to have_content("Hometown: Galaxy, One")
    end

  end

  it "should see a list of each players cards with name and mana cost" do
    visit 'players'
    within "#player-#{player_1.id}-cards" do
      expect(page).to have_content "Cards"
      expect(page).to have_content "Blue Dragon"
      expect(page).to have_content "70"
      expect(page).to have_content "This is the dragon to end all dragons"
    end

  end

end
