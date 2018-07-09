class Ride < ApplicationRecord
  validates :airport, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :event
  has_many   :trips, dependent: :destroy
  has_many   :drives, through: :trips

  after_create  :matching_with_drives

  def matching_with_drives
    Ride.all.each do |ride|
      drives = Drive.all.where(airport: ride.airport, date: ride.date)
      drives.each do |drive|
        Trip.where(drive: drive, ride: ride, user_id: ride.user.id).first_or_create
      end
    end
  end

  def reserved!
    self.drives.includes(:trips).where(trips: {user_id: self.user.id}, trips:{ reserved: true})
  end

  def available!
    available_rides = self.drives.includes(:trips).where(reserved: false)
    return available_rides if !self.full_ride && !available_rides.empty?
  end

  def ride_spots
    if self.full_ride
      return "Reserved"
    else
      return "not full"
    end
  end

  def full_ride
    trips = self.trips.where(trips: {user_id: self.user.id}, trips:{reserved: true})
    if !trips.empty?
      spots = []
      trips.each do |trip|
        spots << trip.ride_spot
      end
      spot = spots.max - self.spot
      spot >= self.spot ? true : false
  else
    return false
  end
  end

  def not_full_ride
    trip = self.trips.where(trips: {user_id: self.user.id}, trips:{reserved: true})
  end

  def trip_ride_spot
    trip = self.trips.where(trips: {user_id: self.user.id}, trips:{reserved: true})
    return trip.last.ride_spot unless trip.empty?
  end

  def available_rides
    rides = []
    rides <<  self.reserved! unless self.reserved!.nil?
    rides << self.available! unless self.available!.nil?
    rides.flatten
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
