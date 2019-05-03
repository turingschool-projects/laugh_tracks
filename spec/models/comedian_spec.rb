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
      @comedian_4 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
      @comedian_2 = Comedian.create(name: "Jerry Seinfeld", age: 64, birthplace: "Brooklyn, NY", image_url: "https://www.gannett-cdn.com/-mm-/aec403ad632f33650ec1aa7926a673a5a6b987b8/c=420-0-2149-1300/local/-/media/2015/09/17/Westchester/Westchester/635780965457520146--ASBBrd-07-27-2012-PressMon-1-A002-2012-07-26-IMG-People-Seinfeld-7-1-4U1UD.jpg?width=534&height=401&fit=crop")
      @comedian_3 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.maxim.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_1400/MTQ4NDk2MjMzNzY0MjM0Nzc2/joe-rogan.webp")
      @comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")

      @special_1 = Special.create(name: "Walk Your Way Out", runtime_mins: 77, image_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg", comedian: Comedian.find_by(name: "Bill Burr"))
      @special_2 = Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, image_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg", comedian: Comedian.find_by(name: "Bill Burr"))
      @special_3 = Special.create(name: "You People Are All The Same", runtime_mins: 69, image_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg", comedian: Comedian.find_by(name: "Bill Burr"))
      @special_4 = Special.create(name: "Triggered", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BYTE0M2FkNGMtYjYxNi00MDRkLWE0YWUtNWI4NWU3NWIzMWIzXkEyXkFqcGdeQXVyMzE5NzI0NjE@._V1_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))
      @special_5 = Special.create(name: "Rocky Mountain High", runtime_mins: 63, comedian_id: 2, image_url: "https://m.media-amazon.com/images/M/MV5BNjI4OGY5MTktZjNiNC00MTgyLTlhZGMtMzBhYzcyZTI5YTljXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX750_AL_.jpg", comedian: Comedian.find_by(name: "Joe Rogan"))
      @special_6 = Special.create(name: "Live At The Beacon Theater", runtime_mins: 63, image_url: "https://m.media-amazon.com/images/M/MV5BNzIxMTUxMjYzMV5BMl5BanBnXkFtZTcwMDYwMjE0Nw@@._V1_.jpg", comedian: Comedian.find_by(name: "Louis C.K."))
      @special_7 = Special.create(name: "Hilarious", runtime_mins: 88, image_url: "https://m.media-amazon.com/images/M/MV5BNTQyODYyNzcxN15BMl5BanBnXkFtZTgwOTA3MzcwMzE@._V1_.jpg", comedian: Comedian.find_by(name: "Louis C.K."))
      @special_8 = Special.create(name: "Jerry Before Seinfeld", runtime_mins: 62, image_url: "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_.jpg", comedian: Comedian.find_by(name: "Jerry Seinfeld"))
    end
    it ".ages returns unique list of ages" do
      @comedians = Comedian.all
      expect(@comedians.ages).to eq([50, 51, 64])
    end
    it ".special_count returns the number of specials per comedian" do

      expect(@comedian_1.special_count).to eq(3)
      expect(@comedian_2.special_count).to eq(1)
      expect(@comedian_3.special_count).to eq(2)
      expect(@comedian_4.special_count).to eq(2)
    end
    it ".average_age" do
      @comedians = Comedian.all
      expect(@comedians.average_age).to eq(54)
    end
    it ".birthplaces" do
      comedian_5 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "www.google.com")
      @comedians = Comedian.all
      expect(@comedians.birthplaces.uniq).to eq(["Brooklyn, NY" ,"Canton, MA", "Newark, NJ", "Washington, D.C."])
    end
    it ".total_specials" do
      @comedians = Comedian.all

      expect(@comedians.total_specials).to eq(8)
    end
    it ".average_special_length" do
      @comedians = Comedian.all

      expect(@comedians.average_special_length.to_i).to eq(70)
    end
    it ".order_name" do
      @comedians = Comedian.all

      expect(@comedians.order_name("asc")).to eq([@comedian_1, @comedian_2, @comedian_3, @comedian_4])
      expect(@comedians.order_name("desc")).to eq([@comedian_4, @comedian_3, @comedian_2, @comedian_1])
    end
    it ".order_bp" do
      @comedians = Comedian.all

      expect(@comedians.order_bp("asc")).to eq([@comedian_2, @comedian_1, @comedian_3, @comedian_4])
      expect(@comedians.order_bp("desc")).to eq([@comedian_4, @comedian_3, @comedian_1, @comedian_2])
    end
  end
end
