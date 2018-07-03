class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :airport
      t.integer :flight_number
      t.integer :spot, null: false, default: 0
      t.date :date
      t.time :time
    end
  end
end
