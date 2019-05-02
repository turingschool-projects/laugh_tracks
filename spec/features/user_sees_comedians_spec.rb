RSpec.describe "an unauthenticated user visiting welcome page" do
  it "should see a comedians age, name and city" do

    visit '/'

    expect(page).to have_content(comedian.age)
    expect(page).to have_content(comedian.name)
    expect(page).to have_content(comedian.city)
  end
end
