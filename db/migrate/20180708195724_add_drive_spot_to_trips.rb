class AddDriveSpotToTrips < ActiveRecord::Migration[5.1]
  def change
      add_column :trips, :drive_spot, :integer, null: false, default: 0
  end
end
