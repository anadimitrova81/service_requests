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

ActiveRecord::Schema[8.1].define(version: 2026_02_17_100000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "requests_status", ["pending", "pickup_confirmed", "picked_up", "in_progress", "ready_for_delivery", "delivery_confirmed", "delivered", "cancelled"]
  create_enum "user_role", ["admin", "courier", "operator", "coordinator"]

  create_table "requests", force: :cascade do |t|
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.decimal "amount", precision: 10, scale: 2
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.string "customer_id"
    t.datetime "delivery_at"
    t.string "email"
    t.string "name"
    t.integer "number_of_items"
    t.string "phone", null: false
    t.datetime "pick_up_at"
    t.enum "status", default: "pending", null: false, enum_type: "requests_status"
    t.datetime "updated_at", null: false
    t.decimal "weight", precision: 10, scale: 2
    t.index ["customer_id"], name: "index_requests_on_customer_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.enum "role", default: "operator", null: false, enum_type: "user_role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
