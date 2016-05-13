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

ActiveRecord::Schema.define(version: 20160513093509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.string  "caption",     null: false
    t.text    "description", null: false
    t.float   "price"
    t.string  "shop_name"
    t.integer "guest_id"
  end

  add_index "gifts", ["guest_id"], name: "index_gifts_on_guest_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string  "first_name"
    t.string  "surname"
    t.text    "address"
    t.boolean "attending"
    t.integer "food_preference"
  end

end
