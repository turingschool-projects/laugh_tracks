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
  it 'shows band albums' do
    band_1 = Band.create(name: "The Bombpops", city: "San Diego", age: 10)
    album_1 = band_1.albums.create(name: "Dear Beer", track_count: 4)
    album_2 = band_1.albums.create(name: "Fear of Missing Out", track_count: 13)

    band_2 = Band.create(name: "Bad Cop Bad Cop", city: "San Pedro", age: 8)
    album_5 = band_2.albums.create(name: "Boss Lady", track_count: 4)
    album_6 = band_2.albums.create(name: "Warriors", track_count: 4)

    visit '/bands'

    expect(page).to have_content(album_1.name)
    expect(page).to have_content(album_1.track_count)
    expect(page).to have_content(album_2.name)
    expect(page).to have_content(album_2.track_count)
    expect(page).to have_content(album_5.name)
    expect(page).to have_content(album_5.track_count)
    expect(page).to have_content(album_6.name)
    expect(page).to have_content(album_6.track_count)
  end
end
