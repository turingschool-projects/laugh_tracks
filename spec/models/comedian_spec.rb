require "rails_helper"

describe Comedian do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :specials }

  end

  describe ".average_age" do
    it "returns the average age of comedians" do
      comedian_1 = Comedian.create(name: "george", age: 20, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 33, city: 'Austin')
      expect(Comedian.average_age).to eq(40)

    end
  end
end
