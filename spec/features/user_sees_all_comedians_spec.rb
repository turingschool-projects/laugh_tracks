# User Story 1
#
# As a visitor
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age
#   * City
#
# - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
# - The city attribute can hold birthplace or current known hometown.
# - For testing, you should ensure that the name, age and city only appear on a
#   specific area of the page for that single comedian.

# require "rails_helper"
#
# describe "visitor" do
#   describe "they see a list of comedians" do
#     it "displays information for each comedian" do
#       comedian_1 = Comedian.create!(name: 'Anabelle', age: 32, city: 'Vancouver')
#       comedian_2 = Comedian.create!(name: 'Miklo', age: 47, city: 'Denver')
#
#       visit '/comedians'
#
#       expect(page).to have_content(comedian_1.name)
#       expect(page).to have_content(comedian_2.name)
#       expect(page).to have_content(comedian_1.age)
#       expect(page).to have_content(comedian_2.age)
#       expect(page).to have_content(comedian_1.city)
#       expect(page).to have_content(comedian_2.city)
#     end
#   end
# end
