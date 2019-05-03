require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :city }
  end



  describe "relationships" do
    it { should have_many :specials }
  end

  describe "instance_methods" do
    before :each do
      @comedian_1 = Comedian.create!(name: "John", age: 24, city: "Denver", image_url: "google.com")
      @comedian_2 = Comedian.create!(name: "Paul", age: 34, city: "Denver", image_url: "google.com")
      @comedian_1.specials.create!(name: "FOX", runtime_minutes: 30, image_url: "google.com")
      @comedian_1.specials.create!(name: "ABC", runtime_minutes: 60, image_url: "google.com")
    end

    it "specials_count" do
      expect = @comedian_1.specials_count
      expected = 2
      expect(expect).to eq(expected)
    end
  end

  #write test for comedian age
end
