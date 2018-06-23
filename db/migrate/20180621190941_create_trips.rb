class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :ride, foreign_key: true, null: false
      t.references :drive, foreign_key: true, null: false
    end
  end
end
