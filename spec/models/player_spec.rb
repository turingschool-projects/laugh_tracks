require 'rails_helper'

describe Player, type: :model do
  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :image }
  end

  describe "relationships" do
    it { should have_many :cards }
  end

  describe "class methods" do

    it "should players whose age match show_by_age arguement" do
     player_1 = Player.create(name: "Joe", age: 31, hometown: "Springfield, MA", image: "https://cdn.dribbble.com/users/567082/screenshots/4356358/profile_picture.png")
    player_2 = Player.create(name: "Jesse", age:41, hometown: "Galaxy, One", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcsgCEvJH9nG7sQdxuiB5ZFcYdO77YO3f10Ig-lOdCYxX9HrKb")

    player_1.cards.create(name: "Blue Dragon", cost:70, description: "This is the dragon to end all dragons")
     
    expect(Player.select_by_age(player_1.age)).to  eq([player_1])

    end
  end
end
