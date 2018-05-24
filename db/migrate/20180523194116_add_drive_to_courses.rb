class AddDriveToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :drive, foreign_key: true
  end
end
