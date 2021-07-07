require 'rails_helper'

RSpec.describe Comedian, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :birthplace }
    it { should validate_presence_of :thumb_url }
  end

  describe 'relationships' do
    it { should have_many :specials }
  end

  before :each do
    @comedian_1 = Comedian.create(name:"Maria Bamford", age: 49,  birthplace: "Port Hueneme, CA", thumb_url: "http://pixel.nymag.com/imgs/daily/vulture/2016/02/23/23-maria-bamford.w1200.h630.jpg")

    @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 49, birthplace: "Washington, D.C.", thumb_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

    @comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", thumb_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")

    @comedians = Comedian.all
  end

    describe 'statistics' do
      it '.average_age' do
      expect(@comedians.average_age).to eq(49.67)
    end
  end
end
