# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180523200432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "airport"
    t.datetime "date"
    t.bigint "ride_id"
    t.bigint "drive_id"
    t.index ["drive_id"], name: "index_courses_on_drive_id"
    t.index ["ride_id"], name: "index_courses_on_ride_id"
  end

  create_table "drives", force: :cascade do |t|
    t.string "airport"
    t.integer "spot"
    t.date "date"
    t.time "time"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_drives_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.string "airport"
    t.integer "flight_number"
    t.string "traveling_status"
    t.integer "spot"
    t.date "date"
    t.time "time"
    t.bigint "user_id"
    t.string "event"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "trip_role", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "drives"
  add_foreign_key "courses", "rides"
  add_foreign_key "drives", "users"
  add_foreign_key "rides", "users"
end
