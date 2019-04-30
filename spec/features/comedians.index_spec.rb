require 'rails_helper'



RSpec.describe "comedians index page", type: :feature do
  before :each do
    @comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
    @comedian_2 = Comedian.create(name: "Joe Rogan", age: 51, birthplace: "Newark, NJ", image_url: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwil2d6_-YvhAhUR0IMKHSTACf4QjRx6BAgBEAU&url=https%3A%2F%2Fwaaf.radio.com%2Fblogs%2Fanthony-capobianco%2F13-rockers-have-appeared-joe-rogan-experience&psig=AOvVaw1DfyJPblSkSVLayC7G5let&ust=1553007377857892")
    @comedian_3 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")
  end

  it "shows all comedians" do

    visit '/comedians'

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_1.age)
    expect(page).to have_content(comedian_1.birthplace)
    expect(page).to have_content(comedian_1.image_url)
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content(comedian_2.age)
    expect(page).to have_content(comedian_2.birthplace)
    expect(page).to have_content(comedian_2.image_url)
    expect(page).to have_content(comedian_3.name)
    expect(page).to have_content(comedian_3.age)
    expect(page).to have_content(comedian_3.birthplace)
    expect(page).to have_content(comedian_3.image_url)
  end
end
