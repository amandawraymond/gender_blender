class ClassifiersController < ApplicationController
  include ClassifiersHelper
  
  def classifier
    @classifier = Classifier.new(Trainer.all).classifier
  end 
end
