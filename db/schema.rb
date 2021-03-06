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

ActiveRecord::Schema.define(version: 20150129220850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
    t.string   "photo"
    t.integer  "user_id",     default: 1
    t.string   "slug"
  end

  create_table "regions", force: true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "farm_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "farmer"
    t.boolean  "admin"
    t.string   "slug"
  end

end
