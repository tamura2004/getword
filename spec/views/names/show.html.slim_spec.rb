require 'rails_helper'

RSpec.describe "names/show", type: :view do
  before(:each) do
    @name = assign(:name, Name.create!(
      :w1 => "W1",
      :w2 => "W2",
      :w3 => "W3",
      :w4 => "W4",
      :w5 => "W5",
      :w6 => "W6",
      :w7 => "W7",
      :w8 => "W8"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/W1/)
    expect(rendered).to match(/W2/)
    expect(rendered).to match(/W3/)
    expect(rendered).to match(/W4/)
    expect(rendered).to match(/W5/)
    expect(rendered).to match(/W6/)
    expect(rendered).to match(/W7/)
    expect(rendered).to match(/W8/)
  end
end
