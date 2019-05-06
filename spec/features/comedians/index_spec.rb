require "rails_helper"

RSpec.describe "comedians index page", type: :feature do
  it "user can see all comedians" do
    # within("comedian_#{comedian.id}") do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ")


    visit "/comedians"

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_1.age)
    expect(page).to have_content(comedian_1.birthplace)
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content(comedian_2.age)
    expect(page).to have_content(comedian_2.birthplace)
  end
end

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit '/comedians'" do
    it "Then I also see a list of each comedian's TV specials" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ")
      special_1 = comedian_1.specials.create(name: "Walk Your Way Out", run_time: 77, comedian_id: 1)

      visit "/comedians"

      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_1.run_time)
    end
  end
end

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit '/comedians'" do
    it "I see a thumbnail image for each comedian" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2  = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://m.media-amazon.com/images/M/MV5BMTMzNDA0NTk1NV5BMl5BanBnXkFtZTYwNzY3MDE0._V1_UX214_CR0,0,214,317_AL_.jpg")
      comedian_3  = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
      comedian_4  = Comedian.create(name: "Joey Diaz", age: 55, birthplace: "Havana, Cuba", image_url: "https://comedycentral.mtvnimages.com/images/ccstandup/comedians/800x600/JoeyDiaz_800x600.jpg?quality=0.91&width=320&height=320&crop=true")

      visit "/comedians"

      expect(page).to have_css("img[src*='https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg']")
      expect(page).to have_css("img[src*='https://m.media-amazon.com/images/M/MV5BMTMzNDA0NTk1NV5BMl5BanBnXkFtZTYwNzY3MDE0._V1_UX214_CR0,0,214,317_AL_.jpg']")
      expect(page).to have_css("img[src*='https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367']")
      expect(page).to have_css("img[src*='https://comedycentral.mtvnimages.com/images/ccstandup/comedians/800x600/JoeyDiaz_800x600.jpg?quality=0.91&width=320&height=320&crop=tru']")
    end
  end
end

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit '/comedians?age=34'" do
    it "Then I see the list of comedians on the page only shows comedians who match the age criteria." do
      visit "/comedians?age=34"
    end
  end
end 

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit '/comedians'" do
    it "For each comedian, I see a count of their TV specials" do
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
      comedian_1.specials.create(name: "Walk Your Way Out", run_time: 77)
      comedian_1.specials.create(name: "I'm Sorry You Feel That Way", run_time: 80)
      comedian_1.specials.create(name: "You People Are All The Same", run_time: 69)

      visit '/comedians'

      expect(page).to have_content(comedian_1.specials.count)
    end
  end
end
