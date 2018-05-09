class Drive < ApplicationRecord
  validates :airport, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user

  def matching_with_rides?
    Ride.all.each do |ride|
       return true if Date.parse(ride.date.to_s) == Date.parse(self.date.to_s) && ride.airport == self.airport
    end
  end
end
