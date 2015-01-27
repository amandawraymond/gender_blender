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
         ClassifierService.classifier
      else 
         ClassifierService.default_classifier
      end
    end

    def self.classifier
      classifier_object = {
        male: {
          height: {
            mean: @male_height_data.mean,
            variance: @male_height_data.variance 
          },
          weight: {
            mean: @male_weight_data.mean,
            variance: @male_weight_data.variance
          }
        },
        female: {
          height: {
            mean: @female_height_data.mean,
            variance: @female_height_data.variance
          },
          weight: {
            mean: @female_weight_data.mean,
            variance: @female_weight_data.variance
          }
        }
      }
    end

    def self.default_classifier
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
      @male_data          = ClassifierService.gender_filter( "male"   )
      @female_data        = ClassifierService.gender_filter( "female" )
      @male_height_data   = ClassifierService.attribute_filter( "height", "male"  )
      @female_height_data = ClassifierService.attribute_filter( "height", "female") 
      @male_weight_data   = ClassifierService.attribute_filter( "weight", "male"  )
      @female_weight_data = ClassifierService.attribute_filter( "weight", "female")
    end

    def self.gender_filter(gender)
      @data.select { |data| data.gender == gender }
    end

    def self.attribute_filter(attribute, gender)
      data = gender_filter(gender)
      if attribute ==  "height"
        data.map { |data| data.height }
      else
        data.map { |data| data.weight }
      end
    end
end