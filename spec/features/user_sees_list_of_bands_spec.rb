require 'rails_helper'


describe 'it shows a list of musicians' do
  it 'shows attributes' do
    band_1 = Band.create(name: "The Bombpops", city: "San Diego", age: 10)
    band_2 = Band.create(name: "Bad Cop Bad Cop", city: "San Pedro", age: 8)

    visit '/bands'

    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_1.city)
    expect(page).to have_content(band_1.age)
    expect(page).to have_content(band_2.name)
    expect(page).to have_content(band_2.city)
    expect(page).to have_content(band_2.age)
  end
end
