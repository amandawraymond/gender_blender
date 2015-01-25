module TrainersHelper
  def female_height_mean
    @classifier_data[:female][:height][:mean]
  end

  def female_weight_mean
    @classifier_data[:female][:weight][:mean]
  end

  def female_height_variance
    @classifier_data[:female][:height][:variance]
  end

  def female_weight_variance
    @classifier_data[:female][:weight][:variance]
  end

  def male_height_mean
    @classifier_data[:male][:height][:mean]
  end

  def male_weight_mean
    @classifier_data[:male][:weight][:mean]    
  end

  def male_height_variance
    @classifier_data[:male][:height][:variance]
  end

  def male_weight_variance
    @classifier_data[:male][:weight][:variance]
  end

end
