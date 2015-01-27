class Contestant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 4,  less_than_or_equal_to: 1230 }
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 108  }
 

end


