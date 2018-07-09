class AddReservedToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :reserved, :boolean, default: false, null: false
  end
end
