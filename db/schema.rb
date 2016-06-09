# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160609032032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string   "caption",                             null: false
    t.text     "description",                         null: false
    t.float    "price"
    t.string   "shop_name"
    t.integer  "guest_id"
    t.string   "gift_image_file_name"
    t.string   "gift_image_content_type"
    t.integer  "gift_image_file_size"
    t.datetime "gift_image_updated_at"
    t.integer  "desired_quantity",        default: 0
    t.integer  "remainder_available",     default: 0
    t.text     "website_link"
    t.integer  "category_id"
  end

  add_index "gifts", ["guest_id"], name: "index_gifts_on_guest_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.text   "address"
  end

  create_table "rsvps", force: :cascade do |t|
    t.boolean "attending",            null: false
    t.string  "meal_preference"
    t.text    "dietary_requirements"
    t.integer "guest_id",             null: false
  end

  add_index "rsvps", ["guest_id"], name: "index_rsvps_on_guest_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
