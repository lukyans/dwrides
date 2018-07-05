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
    avaiable_rides = Ride.all.where(:reserved => false)
    Drive.all.each do |drive|
      rides = avaiable_rides.where(airport: drive.airport, date: drive.date)
      rides.each do |ride|
        trips = Trip.where(drive: drive, ride: ride).first_or_create
      end
    end
  end

  def reserve!
    return if self.reserved
    self.reserved = true
    save
  end

  def reserved?
    true if self.reserved == true
  end

  def cancel!
    return unless self.reserved
    self.reserved = false
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
