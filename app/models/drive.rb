class Drive < ApplicationRecord
  validates :airport, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :event
  has_many   :trips, dependent: :destroy
  has_many   :rides, through: :trips

  after_create :matching_with_rides

  def matching_with_rides
    Drive.all.each do |drive|
      rides = Ride.where(airport: drive.airport)
      rides.each do |ride|
        trips = Trip.where(drive: drive, ride: ride).first_or_create
      end
    end
  end

  def drive_time
    self.date.strftime("%b #{date.day.ordinalize}")
  end

  def event_time
    self.event.date.strftime("%b #{date.day.ordinalize}")
  end

  def event_details
    event = []
    event.push(event_time, self.event.location, self.event.name)
    event.reject(&:blank?).join(", ").to_s
  end
end
