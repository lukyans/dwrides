class AddEventToRides < ActiveRecord::Migration[5.1]
  def change
    add_reference :rides, :event, foreign_key: true, null: false
  end
end
