require 'descriptive_statistics'

class CalculateClassifierService
  def initialize(data)
    @data = data
    filter_data
  end

  def calculate
    if @male_data.length > 1 && @female_data.length > 1
      classifier
    else 
      default_classifier
    end
  end

  private 

    def classifier
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

    def default_classifier
      default_classifier_object = {
        male: {
          height: {
            mean: 67.250,
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

    def filter_data
      @male_data          = gender_filter( "male"   )
      @female_data        = gender_filter( "female" )
      @male_height_data   = attribute_filter( "height", "male"  )
      @female_height_data = attribute_filter( "height", "female") 
      @male_weight_data   = attribute_filter( "weight", "male"  )
      @female_weight_data = attribute_filter( "weight", "female")
    end

    def gender_filter(gender)
      @data.select { |data| data.gender == gender }
    end

    def attribute_filter(attribute, gender)
      data = gender_filter(gender)
      if attribute ==  "height"
        data.map { |data| data.height }
      else
        data.map { |data| data.weight }
      end
    end
end