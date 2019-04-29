require 'rails_helper'

RSpec.describe "specials/show", type: :view do
  before(:each) do
    @special = assign(:special, Special.create!(
      :name => "Name",
      :comedian_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
