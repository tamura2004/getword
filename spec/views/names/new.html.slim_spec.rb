require 'rails_helper'

RSpec.describe "names/new", type: :view do
  before(:each) do
    assign(:name, Name.new(
      :w1 => "MyString",
      :w2 => "MyString",
      :w3 => "MyString",
      :w4 => "MyString",
      :w5 => "MyString",
      :w6 => "MyString",
      :w7 => "MyString",
      :w8 => "MyString"
    ))
  end

  it "renders new name form" do
    render

    assert_select "form[action=?][method=?]", names_path, "post" do

      assert_select "input[name=?]", "name[w1]"

      assert_select "input[name=?]", "name[w2]"

      assert_select "input[name=?]", "name[w3]"

      assert_select "input[name=?]", "name[w4]"

      assert_select "input[name=?]", "name[w5]"

      assert_select "input[name=?]", "name[w6]"

      assert_select "input[name=?]", "name[w7]"

      assert_select "input[name=?]", "name[w8]"
    end
  end
end
