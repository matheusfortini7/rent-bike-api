class Rent < ApplicationRecord
  belongs_to :bike
  belongs_to :client

  validates :start_date, :end_date, :value, :local, :bike_id, :client_id, presence: true
end
