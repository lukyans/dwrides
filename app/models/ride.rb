class Ride < ApplicationRecord
  validates :airport, presence: true
  # validates :flight_number, presence: true
  validates :traveling_status, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user

  def matching_with_drives?
    Drive.all.each do |drive|
      return true if Date.parse(self.date.to_s) == Date.parse(drive.date.to_s) && self.airport == drive.airport
    end
  end
end
