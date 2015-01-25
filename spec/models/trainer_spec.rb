require 'spec_helper'

describe Trainer do
  before { @trainer = Trainer.new(gender: "m", weight: 170, height: 72) }

  subject { @trainer }

  it { should respond_to(:gender) }
  it { should respond_to(:height) }
  it { should respond_to(:weight) }
  it { should be_valid }

  describe "validations" do
    describe "gender" do
      context "not present" do
        before { @trainer.gender = "" }
        it { should_not be_valid }
      end

      context "incorrect format" do
        before { @trainer.gender = "m" * 2 }
        it { should_not be_valid }
      end

      context "incorrect format" do
        before { @trainer.gender = "males" }
        it { should_not be_valid }
      end

      context "correct format" do
        before { @trainer.gender = "Male" }
        it { should be_valid }
      end

      context "correct format" do
        before { @trainer.gender = "male" }
        it { should be_valid }
      end
    end

    describe "weight" do
      context "not present" do
        before { @trainer.weight = "" }
        it { should_not be_valid }
      end

      context "too heavy" do
        before { @trainer.weight = 1231 }
        it { should_not be_valid }
      end

      context "too light" do
        before { @trainer.weight = 3 }
        it { should_not be_valid }
      end

      context "weight in range" do
        before { @trainer.weight = 170}
        it { should be_valid }
      end
    end

    describe "height" do
      context "not present" do
        before { @trainer.height = "" }
        it { should_not be_valid }
      end

      context "too tall" do
        before { @trainer.height = 109 }
        it { should_not be_valid }
      end

      context "too short" do
        before { @trainer.height = 19 }
        it { should_not be_valid }
      end

      context "height in range" do
        before { @trainer.height = 72}
        it { should be_valid }
      end
    end    
  end
end
