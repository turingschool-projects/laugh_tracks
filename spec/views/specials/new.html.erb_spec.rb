require 'rails_helper'

RSpec.describe "specials/new", type: :view do
  before(:each) do
    assign(:special, Special.new(
      :name => "MyString",
      :comedian_id => 1
    ))
  end

  it "renders new special form" do
    render

    assert_select "form[action=?][method=?]", specials_path, "post" do

      assert_select "input[name=?]", "special[name]"

      assert_select "input[name=?]", "special[comedian_id]"
    end
  end
end
