class ClassifierCalulationsService
  include Enumerable

  def initialize(data)
    @male_data          = data.gender_filter("male")
    @female_data        = data.gender_filter("female")
    @male_height_data   = @male_data.attribue_filter("height")
    @female_height_data = @female_data.attribue_filter("height") 
    @male_weight_data   = @male_data.attribue_filter("weight")
    @female_weight_data = @female_data.attribue_filter("weight")
  end

  def get_calculations
    if @male_data.length > 1 && @female_data.length > 1
      self.calculate
    else 
      set_default
    end
  end

  def calculate
    classifier_object = {
      male: {
        mean: {
          height: @male_height_data.mean,
          weight: @male_weight_data.mean
        },
        variance: {
          height: @male_height_data.variance,
          weight: @male_weight_data.variance
        }
      },
      female: {
        mean: {
          height: @female_height_data.mean,
          weight: @female_weight_data.mean
        },
        variance: {
          height: @female_height_data.variance,
          weight: @female_weight_data.variance
        }
      }
    }
  end

  def set_default
    default_classifier_object = {
      male: {
        mean: {
          height: 1,
          weight: 2
        },
        variance: {
          height: 3,
          weight: 4
        }
      },
      female: {
        mean: {
          height: 5,
          weight: 6
        },
        variance: {
          height: 7,
          weight: 8
        }
      }
    }
  end

  private

    attr_reader :gender, :height, :weight

    def gender_filter(gender)
      self.select { |data| data.gender == gender }
    end

    def gender_filter(attribute)
      if attribute ==  "height"
        self.select { |data| data.height }
      else
        self.select { |data| data.weight }
      end
    end
end