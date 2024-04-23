class Bike < ApplicationRecord
  has_many :rents
  
  validates :brand, :model, :color, presence: true
end
