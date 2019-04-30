As a visitor
When I visit `/comedians`
I see a thumbnail image for each comedian

- Image locations (URLs) can be stored in the database as a string.
- Use the image URLs from IMDB or other online source for the special
- Use CSS styling to scale the image smaller if needed to fit on the page

describe "they visit /comedians" do
  it "displays all comedians with images" do

    comedian_1 = Comedian.create!(id: 1, name: "Bob", age: 55, city: "Tucson", image: "https://www.imdb.com/name/nm0402235/mediaviewer/rm2535574016")
    comedian_2 = Comedian.create!(id: 2, name: "Jane", age: 25, city: "Denver", image:" https://www.imdb.com/name/nm0595576/mediaviewer/rm1285895680" )

    visit '/comedians'

    expect(page).to have_image(comedian_1.name)
    expect(page).to have_image(comedian_1.name)

  end
end
end
