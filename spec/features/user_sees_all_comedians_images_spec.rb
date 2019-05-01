
require "rails_helper"

describe "user sees all comedians images" do
  describe "they visit /comedians" do
    it "displays all comedians images" do

      bill = Comedian.create(name: "Bill Burr", age: 50, city: "Canton, MA", image: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
      joe = Comedian.create(name: "Joe Rogan", age: 51, city: "Newark, NJ", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")


      visit '/comedians'
require "pry"; binding
      within "#comedian-#{bill.id}" do
        expect(page).to have_css("img[src*='https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg']")
      end
      within "#comedian-#{joe.id}" do
        expect(page).to have_css("img[src*='https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892']")
      end
    end
  end
end
