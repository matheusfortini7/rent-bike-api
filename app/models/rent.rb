class Rent < ApplicationRecord
  has_many :clients
  has_many :bikes
end
