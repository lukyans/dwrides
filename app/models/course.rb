class Course < ApplicationRecord
  belongs_to :ride
  belongs_to :drive
end
