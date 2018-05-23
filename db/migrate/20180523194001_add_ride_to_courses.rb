class AddRideToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :ride, foreign_key: true
  end
end
