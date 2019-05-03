require "rails_helper"

RSpec.describe 'New Comedian' do
  before :each do
    Special.destroy_all
    Comedian.destroy_all
  end
  describe 'As a visitor' do
    describe 'When I visit the new comedian form' do
      it 'I can create a new comedian' do
        visit '/comedians/new'

        fill_in 'Name', with: 'Ryan'
        fill_in 'Age', with: '32'
        fill_in 'City', with: 'Denver'
        # save_and_open_page

        click_on 'Create Comedian'

        new_comedian = Comedian.last

        # expect(current_path).to eq('/comedians')
        expect(page).to have_content(new_comedian.name)
        expect(page).to have_content(new_comedian.age)
        expect(page).to have_content(new_comedian.city)
      end
    end
  end
end
