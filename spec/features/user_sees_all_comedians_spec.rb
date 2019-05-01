require 'rails_helper'

describe "user sees all comedians" do

  before :each do
    Comedian.destroy_all
  end

  describe "they visit /comedians" do
    it "displays all comedians" do
        comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
        comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")

        visit '/comedians'
        # save_and_open_page
        expect(page).to have_content(comedian_1.name)
        expect(page).to have_content(comedian_2.name)
    end

    it "displays comedian info in the specific comedian area"
      comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")

      visit '/comedians'

      within '#comedian_1' do
        expect(page).to have_content("Bill Burr")
        expect(page).to have_content("50")
        expect(page).to have_content("Canton, MA")
        expect(page).to have_content("https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      end

      within '#comedian_#{comedian_2.id}'
        expect(page).to have_content("Joe Rogan")
        expect(page).to have_content("51")
        expect(page).to have_content("Newark, NJ")
        expect(page).to have_content("https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")
      end
    end


  end
end
