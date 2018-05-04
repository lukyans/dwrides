class CreateDrives < ActiveRecord::Migration[5.1]
  def change
    create_table :drives do |t|
      t.string :airport
      t.integer :spot
      t.date :date
      t.time :time
    end
  end
end
