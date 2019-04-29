require 'rails_helper'

RSpec.describe "comedians/index", type: :view do
  before(:each) do
    assign(:comedians, [
      Comedian.create!(
        :name => "Name",
        :age => "",
        :city => "City"
      ),
      Comedian.create!(
        :name => "Name",
        :age => "",
        :city => "City"
      )
    ])
  end

  it "renders a list of comedians" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
