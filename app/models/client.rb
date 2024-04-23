class Client < ApplicationRecord
  has_many :rents
  
  validates :name, :phone, :address, presence: true
end
