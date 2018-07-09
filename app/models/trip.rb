class Trip < ApplicationRecord
  belongs_to :drive
  belongs_to :ride
  belongs_to :user
end
