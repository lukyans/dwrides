class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :airport
      t.integer :flight_number
      t.string :traveling_status
      t.integer :spot
      t.datetime :date
    end
  end
end
