require 'rails_helper'

RSpec.describe "names/index", type: :view do
  before(:each) do
    assign(:names, [
      Name.create!(
        :w1 => "W1",
        :w2 => "W2",
        :w3 => "W3",
        :w4 => "W4",
        :w5 => "W5",
        :w6 => "W6",
        :w7 => "W7",
        :w8 => "W8"
      ),
      Name.create!(
        :w1 => "W1",
        :w2 => "W2",
        :w3 => "W3",
        :w4 => "W4",
        :w5 => "W5",
        :w6 => "W6",
        :w7 => "W7",
        :w8 => "W8"
      )
    ])
  end

  it "renders a list of names" do
    render
    assert_select "tr>td", :text => "W1".to_s, :count => 2
    assert_select "tr>td", :text => "W2".to_s, :count => 2
    assert_select "tr>td", :text => "W3".to_s, :count => 2
    assert_select "tr>td", :text => "W4".to_s, :count => 2
    assert_select "tr>td", :text => "W5".to_s, :count => 2
    assert_select "tr>td", :text => "W6".to_s, :count => 2
    assert_select "tr>td", :text => "W7".to_s, :count => 2
    assert_select "tr>td", :text => "W8".to_s, :count => 2
  end
end
