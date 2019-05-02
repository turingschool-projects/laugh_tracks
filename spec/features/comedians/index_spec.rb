require "rails_helper"

RSpec.describe "comedians index page", type: :feature do
  it "user can see all comedians" do
  
    comedian_1 = Comedian.create(name: 'John', age: '33', city: 'Denver', imageurl: 'https://m.media-amazon.com/images/M/MV5BMTc2NzQ0MDAwMV5BMl5BanBnXkFtZTcwMzMxNzg1NA@@._V1_UY317_CR11,0,214,317_AL_.jpg')
    comedian_2 = Comedian.create(name: 'Sally', age: '22', city: 'Chicago')

    visit "/comedians"

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content("Age: #{comedian_1.age}")
    expect(page).to have_content("City: #{comedian_1.city}")
    expect(page).to have_css("img[src*='#{comedian_1.imageurl}']")
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content("Age: #{comedian_2.age}")
    expect(page).to have_content("City: #{comedian_2.city}")
  end

  it "user can see a list of each comedian's TV specials" do
    comedian_1 = Comedian.create(name: 'John', age: '33', city: 'Denver')
    comedian_2 = Comedian.create(name: 'Sally', age: '22', city: 'Chicago')
    special_1 = comedian_1.televisionspecials.create(name: 'Late Night', runtime: '120 minutes')
    special_2 = comedian_1.televisionspecials.create(name: 'The Real Late Night', runtime: '95 minutes')
    special_3 = comedian_2.televisionspecials.create(name: 'The Shack', runtime: '13 minutes')

    visit "/comedians"

    expect(page).to have_content(special_1.name)
    expect(page).to have_content(special_1.runtime)
    expect(page).to have_content(special_2.name)
    expect(page).to have_content(special_2.runtime)
    expect(page).to have_content(special_3.name)
    expect(page).to have_content(special_3.runtime)
  end

  it "user can query by age and display only those comedians" do
    comedian_1 = Comedian.create(name: 'John', age: '34', city: 'Denver', imageurl: 'https://m.media-amazon.com/images/M/MV5BMTc2NzQ0MDAwMV5BMl5BanBnXkFtZTcwMzMxNzg1NA@@._V1_UY317_CR11,0,214,317_AL_.jpg')
    comedian_2 = Comedian.create(name: 'Sally', age: '21', city: 'Chicago')
    comedian_3 = Comedian.create(name: 'John', age: '34', city: 'Denver')
    comedian_4 = Comedian.create(name: 'Sally', age: '22', city: 'Chicago')
    special_1 = comedian_1.televisionspecials.create(name: 'Late Night', runtime: '120 minutes')
    special_2 = comedian_1.televisionspecials.create(name: 'The Real Late Night', runtime: '95 minutes')
    special_3 = comedian_2.televisionspecials.create(name: 'The Shack', runtime: '13 minutes')

    visit "/comedians?age=34"

    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content("Age: #{comedian_1.age}")
    expect(page).to have_content("City: #{comedian_1.city}")
    expect(page).to have_css("img[src*='#{comedian_1.imageurl}']")
    expect(page).to have_no_content(comedian_2.name)
    expect(page).to have_no_content("Age: #{comedian_2.age}")
    expect(page).to have_no_content("City: #{comedian_2.city}")
    expect(page).to have_content(comedian_3.name)
    expect(page).to have_content("Age: #{comedian_3.age}")
    expect(page).to have_content("City: #{comedian_3.city}")
    expect(page).to have_no_content(comedian_4.name)
    expect(page).to have_no_content("Age: #{comedian_4.age}")
    expect(page).to have_no_content("City: #{comedian_4.city}")
    expect(page).to have_content(special_1.name)
    expect(page).to have_content(special_1.runtime)
    expect(page).to have_content(special_2.name)
    expect(page).to have_content(special_2.runtime)
    expect(page).to have_no_content(special_3.name)
    expect(page).to have_no_content(special_3.runtime)
  end

  it "user can see a count of each comedians TV specials" do
    comedian_1 = Comedian.create(name: 'John', age: '34', city: 'Denver', imageurl: 'https://m.media-amazon.com/images/M/MV5BMTc2NzQ0MDAwMV5BMl5BanBnXkFtZTcwMzMxNzg1NA@@._V1_UY317_CR11,0,214,317_AL_.jpg')
    comedian_2 = Comedian.create(name: 'Sally', age: '21', city: 'Chicago')
    special_1 = comedian_1.televisionspecials.create(name: 'Late Night', runtime: '120 minutes')
    special_2 = comedian_1.televisionspecials.create(name: 'The Real Late Night', runtime: '95 minutes')
    special_3 = comedian_2.televisionspecials.create(name: 'The Shack', runtime: '13 minutes')
    
    visit "/comedians"

    expect(page).to have_content("Televison Specials: 2")
    expect(page).to have_content("Televison Specials: 1")
  end

  it "user can see statistics about comedians on page" do
    comedian_1 = Comedian.create(name: 'John', age: '34', city: 'Denver')
    comedian_2 = Comedian.create(name: 'Sally', age: '21', city: 'Chicago')
    comedian_3 = Comedian.create(name: 'Jason', age: '34', city: 'Denver')

    visit "/comedians"

    expect(page).to have_content("Statistics")
    expect(page).to have_content("Average Age: 29")
    expect(page).to have_content("Chicago")

    visit "/comedians?age=34"

    expect(page).to have_content("Average Age: 34")
    expect(page).to have_content("Denver")
  end
end