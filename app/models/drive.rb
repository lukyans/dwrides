class Drive < ApplicationRecord
  validates :airport, presence: true
  validates :spot, presence: true
  validates :date, presence: true

  belongs_to :user
end
