# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_23_080916) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "departure_airport_id", null: false
    t.bigint "arrival_airport_id", null: false
    t.datetime "start_date"
    t.interval "flight_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
end
