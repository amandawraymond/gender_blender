class GenderPredictionService
  
  def initialize(contestant_data)
    @weight        = contestant_data.weight
    @height        = contestant_data.height
    @classifier    = Classifier.new(Trainer.all).classifier
    make_prediction 
  end

  def prediction
    nil_check 
    max_value = @posteriors.max_by{|key,value| value}
    max_value.first.to_s
  end

  def not_prediction
    min_value = @posteriors.min_by{|key,value| value}
    min_value.first.to_s
  end

  def save_prediction_as_trainer(input)
    get_trainer_with_prediction(input)
  end

    private

    def nil_check
    @posteriors.delete_if { |key, value| value.nil? || value.nan? }
    end

    def make_prediction
      calculate_posteriors
    end

    def calculate_posteriors
      @posteriors = {
        male: male_posterior,
        female: female_posterior
      }
    end

    def male_posterior
      male_probability   = 0.5
      male_probability * probability_density(male_height_variance, @height, male_height_mean) * probability_density(male_weight_variance, @weight, male_weight_mean)
    end

    def female_posterior
      female_probability = 0.5
      female_probability * probability_density(female_height_variance, @height, female_height_mean) * probability_density(female_weight_variance, @weight, female_weight_mean)
    end
    
    def probability_density(variance, sample, mean)
      probability_distribution_equation(variance, sample, mean)
    end

    def probability_distribution_equation(variance, sample, mean)
      (1/(Math.sqrt(2*Math::PI*variance)))*Math.exp((-1 * (sample-mean)**2)/(2*variance))
    end

    def get_trainer_with_prediction(input)
      if input == "correct"
        trainer_with_prediction(prediction)
      else 
        trainer_with_prediction(not_prediction)
      end
    end

    def trainer_with_prediction(gender_prediction)
      Trainer.create({
        gender: gender_prediction,
        height: @height,
        weight: @weight
        })
    end

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