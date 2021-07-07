require 'rails_helper'

RSpec.describe "comedians index page", type: :feature do
  before :each do
    @comedian_1 = Comedian.create(name:"Maria Bamford", age: 49,  birthplace: "Port Hueneme, CA", thumb_url: "http://pixel.nymag.com/imgs/daily/vulture/2016/02/23/23-maria-bamford.w1200.h630.jpg")

    @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 49, birthplace: "Washington, D.C.", thumb_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

    @comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", thumb_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")

    @special_1 = @comedian_1.specials.create(name: "Walk Your Way Out", runtime: 77, thumb_url: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")

    @special_2 = @comedian_1.specials.create(name: "I'm Sorry You Feel That Way", runtime: 80, thumb_url: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")

    @special_3 = @comedian_2.specials.create(name: "You People Are All The Same", runtime: 69,  thumb_url: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
  end

  it "shows all comedians" do

    visit '/comedians'
  save_and_open_page
    expect(page).to have_content(@comedian_1.name)
    expect(page).to have_content(@comedian_1.age)
    expect(page).to have_content(@comedian_1.birthplace)
    expect(page).to have_xpath("//img[contains(@src,'#{@comedian_1.thumb_url}')]")

    expect(page).to have_content(@comedian_2.name)
    expect(page).to have_content(@comedian_2.age)
    expect(page).to have_content(@comedian_2.birthplace)
    expect(page).to have_xpath("//img[contains(@src,'#{@comedian_2.thumb_url}')]")

    expect(page).to have_content(@comedian_3.name)
    expect(page).to have_content(@comedian_3.age)
    expect(page).to have_content(@comedian_3.birthplace)
    expect(page).to have_xpath("//img[contains(@src,'#{@comedian_3.thumb_url}')]")
    save_and_open_page
  end

  it "shows name and runtime of all specials" do

    visit '/comedians'

    within("#Comedian-#{@comedian_1.id}") do
      expect(page).to have_content(@special_1.name)
      expect(page).to have_content(@special_1.runtime)

      expect(page).to have_content(@special_2.name)
      expect(page).to have_content(@special_2.runtime)

      expect(page).to_not have_content(@special_3.name)
      expect(page).to_not have_content(@special_3.runtime)

    end
  end

    it "shows list of comedians by age critera" do
      visit '/comedians?age=49'

      within("#Comedian-#{@comedian_1.id}") do
        expect(page).to have_content(@comedian_1.name)
        expect(page).to have_content(@comedian_1.age)
        expect(page).to have_content(@comedian_1.birthplace)
        expect(page).to have_xpath("//img[contains(@src,'#{@comedian_1.thumb_url}')]")
      end

      within("#Comedian-#{@comedian_2.id}") do
        expect(page).to have_content(@comedian_2.name)
        expect(page).to have_content(@comedian_2.age)
        expect(page).to have_content(@comedian_2.birthplace)
        expect(page).to have_xpath("//img[contains(@src,'#{@comedian_2.thumb_url}')]")
      end

        expect(page).to_not have_content(@comedian_3.name)
    end

    it "shows the specials count" do
      visit '/comedians'

      within("#Comedian-#{@comedian_1.id}") do
        expect(page).to have_content(@comedian_1.specials_count)
      end

      within("#Comedian-#{@comedian_2.id}") do
        expect(page).to have_content(@comedian_2.specials_count)
      end

      within("#Comedian-#{@comedian_3.id}") do
        expect(page).to have_content(@comedian_3.specials_count)
      end
    end
end
