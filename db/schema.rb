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

ActiveRecord::Schema[7.0].define(version: 2023_08_09_003259) do
  create_table "places", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.binary "external_id", limit: 16, null: false
    t.string "city", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city", "name"], name: "index_places_on_city_and_name"
    t.index ["external_id"], name: "index_places_on_external_id", unique: true
  end

end
