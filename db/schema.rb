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

ActiveRecord::Schema.define(version: 20150523021659) do

  create_table "calenders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.boolean  "public",     limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "calenders", ["user_id"], name: "index_calenders_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "calender_id", limit: 4
    t.string   "title",       limit: 255,                null: false
    t.boolean  "all_day",     limit: 1,   default: true, null: false
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "events", ["calender_id"], name: "index_events_on_calender_id", using: :btree
  add_index "events", ["end"], name: "index_events_on_end", using: :btree
  add_index "events", ["start"], name: "index_events_on_start", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "nickname",        limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "admin",           limit: 1,   default: false, null: false
  end

  add_foreign_key "calenders", "users"
  add_foreign_key "events", "calenders"
  add_foreign_key "events", "users"
end
