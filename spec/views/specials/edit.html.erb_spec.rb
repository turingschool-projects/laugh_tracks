require 'rails_helper'

RSpec.describe "specials/edit", type: :view do
  before(:each) do
    @special = assign(:special, Special.create!(
      :name => "MyString",
      :comedian_id => 1
    ))
  end

  it "renders the edit special form" do
    render

    assert_select "form[action=?][method=?]", special_path(@special), "post" do

      assert_select "input[name=?]", "special[name]"

      assert_select "input[name=?]", "special[comedian_id]"
    end
  end
end
