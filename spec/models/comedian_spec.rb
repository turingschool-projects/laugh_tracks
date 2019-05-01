require 'rails_helper'

describe Comedian, type: :model do
  describe "Relationships" do
    it { should have_many :specials}
  end
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :birthplace}
    it { should validate_presence_of :image_url}
  end
  describe 'class methods' do
    before :each do
      @comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      @comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 64, birthplace: "Brooklyn, NY", image_url: "https://www.gannett-cdn.com/-mm-/aec403ad632f33650ec1aa7926a673a5a6b987b8/c=420-0-2149-1300/local/-/media/2015/09/17/Westchester/Westchester/635780965457520146--ASBBrd-07-27-2012-PressMon-1-A002-2012-07-26-IMG-People-Seinfeld-7-1-4U1UD.jpg?width=534&height=401&fit=crop")
      @comedian_3 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.maxim.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_1400/MTQ4NDk2MjMzNzY0MjM0Nzc2/joe-rogan.webp")
      @comedian_4 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
    end
    it ".ages returns unique list of ages" do
      @comedians = Comedian.all
      expect(@comedians.ages).to eq([50, 51, 64])
    end
  end
end
