class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :location
      t.string :airport
      t.datetime :date
    end
  end
end
