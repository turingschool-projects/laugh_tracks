require 'rails_helper'

RSpec.describe "comedians/show", type: :view do
  before(:each) do
    @comedian = assign(:comedian, Comedian.create!(
      :name => "Name",
      :age => "",
      :city => "City"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/City/)
  end
end
