require 'rails_helper.rb'

RSpec.describe 'comedians index page' do

  it 'shows comedians' do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")

    visit '/comedians'

    within "##{comedian_1.id}" do
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.birthplace)
    end

    within "##{comedian_2.id}" do
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
    end

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_2.name)

  end

  it "shows specials under comedian with name and runtime" do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.")
    comedian_1.specials.create(name: "Walk Your Way Out", runtime_mins: 77)
    special_1 = Special.create(name: "I'm Sorry You Feel That Way", runtime_mins: 80, comedian_id: comedian_1.id)
    comedian_2.specials.create(name: "Rocky Mountain High", runtime_mins: 63)

    visit '/comedians'


    within "##{comedian_1.id}" do
      expect(page).to have_content(comedian_1.specials.first.name)
      expect(page).to have_content(comedian_1.specials.first.runtime_mins)
      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_1.runtime_mins)
    end

    within "##{comedian_2.id}" do
      expect(page).to have_content(comedian_2.specials.first.runtime_mins)
      expect(page).to have_content(comedian_2.specials.first.runtime_mins)
    end

  end

  it "shows thumbnail with comedian" do
    comedian_1 = Comedian.create(name: "Bill Burr", age: 50, birthplace: "Canton, MA", image_url: "https://image.masslive.com/home/mass-media/width960/img/entertainment/photo/nashville-comedy-festival-21d347107e975672.jpg")
    comedian_2 = Comedian.create(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "https://media1.fdncms.com/pittsburgh/imager/u/blog/13239255/louis_ck_kuwait_crop_cropped.jpg?cb=1548183367")

    within "##{comedian_1.id}" do
      expect(page).to have_xpath("//img[@src='#{comedian_1.image_url}']")
    end

    within "##{comedian_2.id}" do
      expect(page).to have_xpath("//img[@src='#{comedian_2.image_url}']")
    end

  end

end
