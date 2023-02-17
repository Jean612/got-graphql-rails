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

ActiveRecord::Schema[7.0].define(version: 2023_02_17_231114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "species"
    t.string "character_type"
    t.string "gender"
    t.string "image"
    t.string "url"
    t.bigint "location_id"
    t.bigint "origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_characters_on_location_id"
    t.index ["name"], name: "index_characters_on_name"
    t.index ["origin_id"], name: "index_characters_on_origin_id"
    t.index ["url"], name: "index_characters_on_url"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.string "dimension"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name"
    t.index ["url"], name: "index_locations_on_url"
  end

  add_foreign_key "characters", "locations"
  add_foreign_key "characters", "locations", column: "origin_id"
end
