class ClassifiersController < ApplicationController
  def classifier
    @female_height_mean = Classifier.set_mean("height","female")
    @female_weight_mean = Classifier.set_mean("weight","female")
    @male_height_mean = Classifier.set_mean("height","male")
    @male_weight_mean = Classifier.set_mean("weight","male")
    # @female_height_variance = Classifier.set_variance("height","female")
    # @female_weight_variance = Classifier.set_variance("weight","female")
    # @male_height_variance = Classifier.set_variance("height","male")
    # @male_weirght_variance = Classifier.set_variance("weight","male")
  end

end
