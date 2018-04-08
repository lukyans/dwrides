class CreateDrives < ActiveRecord::Migration[5.1]
  def change
    create_table :drives do |t|
      t.string :airport
      t.integer :spots
      t.datetime :date
    end
  end
end
