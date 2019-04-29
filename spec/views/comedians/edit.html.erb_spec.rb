require 'rails_helper'

RSpec.describe "comedians/edit", type: :view do
  before(:each) do
    @comedian = assign(:comedian, Comedian.create!(
      :name => "MyString",
      :age => "",
      :city => "MyString"
    ))
  end

  it "renders the edit comedian form" do
    render

    assert_select "form[action=?][method=?]", comedian_path(@comedian), "post" do

      assert_select "input[name=?]", "comedian[name]"

      assert_select "input[name=?]", "comedian[age]"

      assert_select "input[name=?]", "comedian[city]"
    end
  end
end
