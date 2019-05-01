require 'rails_helper'

describe Player, type: :model do
  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :hometown }
  end

  describe "relationships" do
    it { should have_many :cards }
  end

end
