class Event < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :airport, presence: true
  validates :date, presence: true

  has_many :rides
  has_many :drives
  belongs_to :user


    belongs_to :call_log
    belongs_to :appointment

  def event_details
    event = []
    event.push(format_time, self.location, self.name)
    event.reject(&:blank?).join(", ").to_s
  end

  def format_time
    self.date.strftime("%b %e") if date.present?
  end
end
