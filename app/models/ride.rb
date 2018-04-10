class Ride < ApplicationRecord
  validates :airport, presence: true
  # validates :flight_number, presence: true
  validates :traveling_status, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user
end
