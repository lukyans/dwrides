class AddUserToDrives < ActiveRecord::Migration[5.1]
  def change
    add_reference :drives, :user, foreign_key: true, null: false
  end
end
