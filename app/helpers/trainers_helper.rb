module TrainersHelper
  def male_height_mean
    @classifier[:male][:height][:mean]
  end

  def male_weight_mean
    @classifier[:male][:weight][:mean]    
  end

  def male_height_variance
    @classifier[:male][:height][:variance]
  end

  def male_weight_variance
    @classifier[:male][:weight][:variance]
  end
  
  def female_height_mean
    @classifier[:female][:height][:mean]
  end

  def female_weight_mean
    @classifier[:female][:weight][:mean]
  end

  def female_height_variance
    @classifier[:female][:height][:variance]
  end

  def female_weight_variance
    @classifier[:female][:weight][:variance]
  end

end
