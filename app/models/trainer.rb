class Trainer < ActiveRecord::Base
  before_save :set_gender_phrasing

  validates :gender, presence: true, inclusion:    { in: %w( m f M F male Male female Female ) }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 4,  less_than_or_equal_to: 1230 }
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 108  }

  private
    def set_gender_phrasing
      male_phrasing = %w[m M male Male]
      if male_phrasing.include?(self.gender)
        self.gender = "male"
      else
        self.gender = "female"
      end
    end
end