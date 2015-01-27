require 'spec_helper'

describe Contestant do
  before { @contestant = Contestant.new(name: "Gary", weight: 170, height: 72) }

  subject { @contestant }

  it { should respond_to(:name) }
  it { should respond_to(:height) }
  it { should respond_to(:weight) }
  it { should be_valid }

  describe "validations" do
    describe "name" do
      context "not present" do
        before { @contestant.name = "" }
        it { should_not be_valid }
      end

      context "too long" do
        before { @contestant.name = "s" * 51 }
        it { should_not be_valid }
      end

      context "correct name" do
        before { @contestant.name = "Gary" }
        it { should be_valid }
      end
    end

    describe "weight" do
      context "not present" do
        before { @contestant.weight = "" }
        it { should_not be_valid }
      end

      context "too heavy" do
        before { @contestant.weight = 1231 }
        it { should_not be_valid }
      end

      context "too light" do
        before { @contestant.weight = 3 }
        it { should_not be_valid }
      end

      context "weight in range" do
        before { @contestant.weight = 170}
        it { should be_valid }
      end
    end

    describe "height" do
      context "not present" do
        before { @contestant.height = "" }
        it { should_not be_valid }
      end

      context "too tall" do
        before { @contestant.height = 109 }
        it { should_not be_valid }
      end

      context "too short" do
        before { @contestant.height = 19 }
        it { should_not be_valid }
      end

      context "height in range" do
        before { @contestant.height = 72}
        it { should be_valid }
      end
    end    
  end
end
