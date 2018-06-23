class AddEventToDrives < ActiveRecord::Migration[5.1]
  def change
    add_reference :drives, :event, foreign_key: true
  end
end
