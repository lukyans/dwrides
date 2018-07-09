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
    Ride.all.each do |ride|
      drives = Drive.all.where(airport: ride.airport, date: ride.date)
      drives.each do |drive|
        Trip.where(drive: drive, ride: ride, user_id: ride.user_id).first_or_create
      end
    end
  end

  def reserve!(ride_id, ride_spot, trip_ride_spot)
    return if self.reserved
    self.reserved = true
    self.trips.where(ride_id: ride_id).update({reserved: self.reserved, ride_spot: ((ride_spot.to_i + self.spot) + trip_ride_spot.to_i)})
    save
  end

  def reserved?
    true if self.reserved == true
  end

  def cancel!(ride_id, ride_spot, trip_ride_spot)
    return unless self.reserved
    self.reserved = false
    self.trips.where(ride_id: ride_id).update({reserved: self.reserved, ride_spot: trip_ride_spot.to_i - self.spot - ride_spot.to_i})
    save
  end

  def canceled?
    true if self.reserved == false
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
