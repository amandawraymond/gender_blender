require 'rails_helper'

RSpec.describe "contestants/edit", :type => :view do
  before(:each) do
    @contestant = assign(:contestant, Contestant.create!(
      :name => "MyString",
      :height => "9.99",
      :weight => "9.99"
    ))
  end

  it "renders the edit contestant form" do
    render

    assert_select "form[action=?][method=?]", contestant_path(@contestant), "post" do

      assert_select "input#contestant_name[name=?]", "contestant[name]"

      assert_select "input#contestant_height[name=?]", "contestant[height]"

      assert_select "input#contestant_weight[name=?]", "contestant[weight]"
    end
  end
end
