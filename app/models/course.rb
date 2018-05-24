class Course < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :airport, presence: true
  validates :date, presence: true

  belongs_to :ride
  belongs_to :drive
  belongs_to :user

  def course_details
    "#{format_time}, #{self.location}, #{self.name}"
  end

  def format_time
    self.date.strftime("%b %e")
  end
end
