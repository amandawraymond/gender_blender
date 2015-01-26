require 'rails_helper'

RSpec.describe "contestants/new", :type => :view do
  before(:each) do
    assign(:contestant, Contestant.new(
      :name => "MyString",
      :height => "9.99",
      :weight => "9.99"
    ))
  end

  it "renders new contestant form" do
    render

    assert_select "form[action=?][method=?]", contestants_path, "post" do

      assert_select "input#contestant_name[name=?]", "contestant[name]"

      assert_select "input#contestant_height[name=?]", "contestant[height]"

      assert_select "input#contestant_weight[name=?]", "contestant[weight]"
    end
  end
end
