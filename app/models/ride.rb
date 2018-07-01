class Ride < ApplicationRecord
  validates :airport, presence: true
  # validates :traveling_status, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :event
  has_many   :trips, dependent: :destroy
  has_many   :drives, through: :trips

  after_create :matching_with_drives

  def matching_with_drives
    Ride.all.each do |ride|
      drives = Drive.where(airport: ride.airport, date: ride.date)
      drives.each do |drive|
        trips = Trip.where(drive: drive, ride: ride).first_or_create
      end
    end
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
