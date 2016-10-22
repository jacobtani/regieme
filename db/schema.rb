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

ActiveRecord::Schema.define(version: 20161021222317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.string  "guest_names"
    t.decimal "contribution_amount"
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "email"
    t.string "age_category"
  end

  create_table "rsvps", force: :cascade do |t|
    t.string  "attending",            null: false
    t.string  "main_meal_preference"
    t.string  "dessert_preference"
    t.text    "dietary_requirements"
    t.integer "guest_id",             null: false
    t.string  "email",                null: false
    t.index ["guest_id"], name: "index_rsvps_on_guest_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
