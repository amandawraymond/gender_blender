require 'descriptive_statistics'
class ClassifierService

  def self.calculate(data)
    @data = data
    ClassifierService.filter_data
    ClassifierService.set_classifier
  end

  private 

    def self.set_classifier
      if @male_data.length > 1 && @female_data.length > 1
         ClassifierService.custom_trained_classifier
      else 
         ClassifierService.standard_trained_classifier
      end
    end

    def self.custom_trained_classifier
      classifier_object = {
        male: {
          height: {
            mean: @male_height_data.mean.round(4),
            variance: @male_height_data.variance 
          },
          weight: {
            mean: @male_weight_data.mean.round(4),
            variance: @male_weight_data.variance
          }
        },
        female: {
          height: {
            mean: @female_height_data.mean.round(4),
            variance: @female_height_data.variance
          },
          weight: {
            mean: @female_weight_data.mean.round(4),
            variance: @female_weight_data.variance
          }
        }
      }
    end

    def self.standard_trained_classifier
      default_classifier_object = {
        male: {
          height: {
            mean: 67.25,
            variance: 26.9167
          },
          weight: {
            mean: 176.25,
            variance: 122.9167
          }
        },
        female: {
          height: {
            mean: 65.0,
            variance: 14.0
          },
          weight: {
            mean: 132.5,
            variance: 558.3333
          }
        }
      }
    end

    def self.filter_data
      ClassifierService.set_filters
      @male_data          = ClassifierService.gender_filter( @@male   )
      @female_data        = ClassifierService.gender_filter( @@female )
      @male_height_data   = ClassifierService.attribute_filter( @@height, @@male  )
      @female_height_data = ClassifierService.attribute_filter( @@height, @@female) 
      @male_weight_data   = ClassifierService.attribute_filter( @@weight, @@male  )
      @female_weight_data = ClassifierService.attribute_filter( @@weight, @@female)
    end

    def self.set_filters
      @@male   = "male"
      @@female = "female"
      @@height = "height"
      @@weight = "weight"
    end

    def self.gender_filter(gender)
      @data.select { |data| data.gender == gender }
    end

    def self.attribute_filter(attribute, gender)
       data = gender_filter(gender)
       data.map { |data| data[attribute] }      
    end
end