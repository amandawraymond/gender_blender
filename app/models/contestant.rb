class Contestant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9  }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 4,  less_than_or_equal_to: 1230 }
  


end


