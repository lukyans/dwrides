class AddUserToDrives < ActiveRecord::Migration[5.1]
  def change
    add_reference :drives, :user, foreign_key: true
  end
end
