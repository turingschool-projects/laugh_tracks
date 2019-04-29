require 'rails_helper'

RSpec.describe "specials/index", type: :view do
  before(:each) do
    assign(:specials, [
      Special.create!(
        :name => "Name",
        :comedian_id => 2
      ),
      Special.create!(
        :name => "Name",
        :comedian_id => 2
      )
    ])
  end

  it "renders a list of specials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
