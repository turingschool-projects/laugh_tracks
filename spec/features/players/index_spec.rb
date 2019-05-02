require "rails_helper"

RSpec.describe "a vistor visiting the players index path" do
  attr_reader :players, :player_1, :player_2, :player_3

  before :each do
    Player.destroy_all
   
    @player_1 = Player.create(name: "Joe", age: 31, hometown: "Springfield, MA", image: "https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")
    @player_2 = Player.create(name: "Jesse", age:41, hometown: "Springfield, MA", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcsgCEvJH9nG7sQdxuiB5ZFcYdO77YO3f10Ig-lOdCYxX9HrKb")
    @player_3 = Player.create(name: "Bob", age:56, hometown: "Boston", image:"http:image.png")
    @player_1.cards.create(name: "Blue Dragon", cost:70, description: "This is the dragon to end all dragons")
    
    @players = [player_1,player_2,player_3]
  end
  
  it "should see a list of players" do 
    visit '/players'
    
    within "#player-#{player_1.id}" do
      expect(page).to have_content("#{player_1.name}")
      expect(page).to have_content("#{player_1.age}")
      expect(page).to have_content("Hometown: #{player_1.hometown}")
      expect(find("#player-#{player_1.id}-image")[:src]).to have_content(player_1.image)
    end

    within "#player-#{player_2.id}" do
      expect(page).to have_content(player_2.name)
      expect(page).to have_content(player_2.age)
      expect(page).to have_content("Hometown: #{player_2.hometown}")
      expect(find("#player-#{player_2.id}-image")[:src]).to have_content(player_2.image)
    end

  end

  it "should see a list of each players cards with name,card cost, and details" do
    visit 'players'

    within "#player-#{player_1.id}-cards" do
      expect(page).to have_content "Cards: "
      expect(page).to have_content "Blue Dragon"
      expect(page).to have_content "70"
      expect(page).to have_content "This is the dragon to end all dragons"
    end
    
  end
 
  it "shows the count of cards per player on page" do
    visit "/players"
    
    [player_1, player_2].each do |player|
      within "#player-#{player.id}-cards" do
        expect(page).to have_content("Cards: #{player.cards.count}")
      end
    end
  end

  describe "A visitor visiting the player path with age param" do 
  
    it "should only shows players based on age" do
      visit "/players/?age=31"

      expect(page).to have_content(player_1.name)
      expect(page).to_not have_content(player_2.name)
    end

  end

  describe "Statistics are shown at top of page" do 
   
    it "should see an area marked Statistics on page" do
      visit "/players"

      expect(page).to have_content("Statistics")
      expect(page).to have_content("Avg Age: #{Player.avg_age.to_i}")
      expect(page).to have_content("Hometowns: #{player_1.hometown}")
    end
  end

end
