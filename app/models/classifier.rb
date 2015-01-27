require 'descriptive_statistics'
class Classifier

  def initialize(data)
    @data = data
    filter_data
    set_classifier  
  end

  def classifier
    @classifier
  end
  
  private

    def set_classifier
      if @male_data.length > 1 && @female_data.length > 1
         @classifier = custom_trained_classifier
      else 
         @classifier = standard_trained_classifier
      end
    end

    def custom_trained_classifier
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

    def standard_trained_classifier
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

    def filter_data
      set_filters
      filter_male_data
      filter_female_data
    end

    def set_filters
      @@male   = "male"
      @@female = "female"
      @@height = "height"
      @@weight = "weight"
    end

    def filter_male_data
      @male_data        = gender_filter( @@male )
      @male_height_data = attribute_filter( @@height, @@male )
      @male_weight_data = attribute_filter( @@weight, @@male )
    end

    def filter_female_data
      @female_data        = gender_filter( @@female )
      @female_height_data = attribute_filter( @@height, @@female ) 
      @female_weight_data = attribute_filter( @@weight, @@female )
    end

    def gender_filter(gender)
      @data.select { |data| data.gender == gender }
    end

    def attribute_filter(attribute, gender)
       data = gender_filter(gender)
       data.map { |data| data[attribute] }      
    end
end