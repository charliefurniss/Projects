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

ActiveRecord::Schema.define(version: 20160113114345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottles", force: :cascade do |t|
    t.string   "vendor"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wine_id"
    t.integer  "user_id"
    t.boolean  "drunk"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "bottle_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "appearance"
    t.text     "nose"
    t.text     "palate"
    t.text     "conclusion"
    t.string   "maturity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wines", force: :cascade do |t|
    t.string   "producer"
    t.string   "name"
    t.integer  "vintage"
    t.string   "region"
    t.string   "country"
    t.text     "grape"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "alcohol"
    t.integer  "window_start"
    t.integer  "window_end"
    t.string   "style"
  end

end
