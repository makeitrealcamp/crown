# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_210023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incidents", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.integer "age", null: false
    t.integer "gender", null: false
    t.integer "status", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.integer "status", default: 0
    t.boolean "validator", default: false
    t.boolean "organization", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "incidents", "users"
end
