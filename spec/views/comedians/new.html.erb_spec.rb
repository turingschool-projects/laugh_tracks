require 'rails_helper'

RSpec.describe "comedians/new", type: :view do
  before(:each) do
    assign(:comedian, Comedian.new(
      :name => "MyString",
      :age => "",
      :city => "MyString"
    ))
  end

  it "renders new comedian form" do
    render

    assert_select "form[action=?][method=?]", comedians_path, "post" do

      assert_select "input[name=?]", "comedian[name]"

      assert_select "input[name=?]", "comedian[age]"

      assert_select "input[name=?]", "comedian[city]"
    end
  end
end
