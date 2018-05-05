require "rails_helper"

RSpec.describe Ride, type: :model do
  it { should validate_presence_of(:airport) }
  # it { should validate_presence_of(:flight_number) }
  it { should validate_presence_of(:traveling_status) }
  it { should validate_presence_of(:spot) }
  it { should validate_presence_of(:date) }

  it { should belong_to(:user) }
end
