require 'rails_helper'

RSpec.describe "contestants/show", :type => :view do
  before(:each) do
    @contestant = assign(:contestant, Contestant.create!(
      :name => "Name",
      :height => "9.99",
      :weight => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
