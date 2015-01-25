class Trainer < ActiveRecord::Base
  before_save :set_gender_phrasing

  validates :gender, presence: true, inclusion: { in: %w( m f M F male Male female Female ) }
  validates :weight, presence: true, numericality: {
    greater_than_or_equal_to: 4, less_than_or_equal_to: 1230
  }
  validates :height, presence: true

  def self.set_default_classifier 
    classifier = {
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

  def self.set_classifier
    classifier = {
      male: {
        height: {
          mean: Trainer.get_mean("male","height"),
          variance: Trainer.get_variance("male","height").round(4)
        },
        weight: {
          mean: Trainer.get_mean("male","weight"),
          variance: Trainer.get_variance("male","weight").round(4)
        }
      },
      female: {
        height: {
          mean: Trainer.get_mean("female","height"),
          variance: Trainer.get_variance("female","height").round(4)
        },
        weight: {
          mean: Trainer.get_mean("female","weight"),
          variance: Trainer.get_variance("female","weight").round(4)
        }
      }
    }
  end

  private
    def self.get_mean(gender, attribute)
      Trainer.filter_data(gender, attribute)
      @attribute_specific_trainers.inject { |sum, attribute| sum + attribute } / Trainer.length
    end

    def self.get_variance(gender, attribute)
      Trainer.filter_data(gender, attribute)
      mean = @attribute_specific_trainers.inject { |sum, attribute| sum + attribute } / Trainer.length
      sum  = @attribute_specific_trainers.inject(0) { |sum, attribute| sum + (attribute - mean)**2}
      sum / (Trainer.length - 1).to_f
    end

    def self.filter_data(gender, attribute)
      @gender_specific_trainers    = Trainer.get_gender_specific_trainers(gender)
      @attribute_specific_trainers = Trainer.get_attribute_specific_trainers(attribute)
    end

    def self.get_attribute_specific_trainers(attribute)
      if attribute ==  "height"
        Trainer.get_height_trainers 
      else 
        Trainer.get_weight_trainers                      
      end
    end

    def self.get_height_trainers
      @gender_specific_trainers.map do |trainer|
        trainer.height
      end
    end

    def self.get_weight_trainers
      @gender_specific_trainers.map do |trainer|
        trainer.weight
      end
    end

    def self.get_gender_specific_trainers(gender)
      Trainer.all.select do |trainer|
        trainer.gender == gender
      end
    end

    def self.length
      BigDecimal.new(@gender_specific_trainers.length)
    end

    def set_gender_phrasing
      male_phrasing = %w[m M male Male]
      if male_phrasing.include?(self.gender)
        self.gender = "male"
      else
        self.gender = "female"
      end
    end
end
