require 'spec_helper'

RSpec.describe ClassifiersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/classifier").to route_to("classifiers#classifier")
    end
  end
end