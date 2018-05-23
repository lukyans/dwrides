class AddEventToRides < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :event, :string
  end
end
