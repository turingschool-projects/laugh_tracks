require "rails_helper"

RSpec.describe "comedians new page", type: :feature do
  it "user can see a form for input" do
    visit '/comedians/new'

    expect(page).to have_css("form")
    fill_in 'Name', with: 'John Smith'
    fill_in 'Age', with: '33'
    fill_in 'City', with: 'Denver'
    fill_in 'Imageurl', with: 'https://m.media-amazon.com/images/M/MV5BMTc2NzQ0MDAwMV5BMl5BanBnXkFtZTcwMzMxNzg1NA@@._V1_UY317_CR11,0,214,317_AL_.jpg'
    click_button 'comedian-create'

    comedian = Comedian.last

    expect(page).to have_content(comedian.name)
    expect(page).to have_content("Age: #{comedian.age}")
    expect(page).to have_content("City: #{comedian.city}")
    expect(page).to have_css("img[src*='#{comedian.imageurl}']")
    expect(page.current_path).to have_content('/comedians')
  end
end