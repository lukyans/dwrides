class AddReservedToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :reserved, :boolean, default: false, null: false
  end
end
