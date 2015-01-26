require 'rails_helper'

RSpec.describe "contestants/index", :type => :view do
  before(:each) do
    assign(:contestants, [
      Contestant.create!(
        :name => "Name",
        :height => "9.99",
        :weight => "9.99"
      ),
      Contestant.create!(
        :name => "Name",
        :height => "9.99",
        :weight => "9.99"
      )
    ])
  end

  it "renders a list of contestants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
