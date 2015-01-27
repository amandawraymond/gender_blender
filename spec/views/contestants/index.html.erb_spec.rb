# require 'spec_helper'

# RSpec.describe "contestants/index", :type => :view do
#   before(:each) do
#     Contestant.destroy_all
#     assign(:contestants, [
#       Contestant.create!(
#         :name => "Gary",
#         :height => 60,
#         :weight => 180
#       ),
#       Contestant.create!(
#         :name => "Gary",
#         :height => 60,
#         :weight => 180
#       )
#     ])
#   end

#   it "renders a list of contestants" do
#     render
#     assert_select "tr>td", :text => "name".to_s, :count => 2
#     assert_select "tr>td", :text => "60".to_s,   :count => 2
#     assert_select "tr>td", :text => "180".to_s,  :count => 2
#   end
# end
