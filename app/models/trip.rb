class Trip < ApplicationRecord
  belongs_to :drive
  belongs_to :ride
end
