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

ActiveRecord::Schema.define(version: 20170128182642) do

  create_table "features", force: :cascade do |t|
    t.string   "name",       limit: 45, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "features_places_joins", force: :cascade do |t|
    t.integer "place_id"
    t.integer "feature_id"
    t.index ["feature_id"], name: "index_features_places_joins_on_feature_id"
    t.index ["place_id"], name: "index_features_places_joins_on_place_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",       limit: 25, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "refers", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "message_id"
    t.integer  "request_id"
    t.integer  "status_request", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["message_id"], name: "index_refers_on_message_id"
    t.index ["request_id"], name: "index_refers_on_request_id"
    t.index ["staff_id"], name: "index_refers_on_staff_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_requests_on_feature_id"
    t.index ["student_id"], name: "index_requests_on_student_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "f_name",          limit: 25, null: false
    t.string   "l_name",          limit: 30, null: false
    t.integer  "place_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "last_login"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["place_id"], name: "index_staffs_on_place_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "f_name",                limit: 25, null: false
    t.string   "l_name",                limit: 35, null: false
    t.string   "father_name",           limit: 25, null: false
    t.string   "meli_code",             limit: 20, null: false
    t.string   "major_name",            limit: 40, null: false
    t.string   "city",                  limit: 35, null: false
    t.string   "maghta",                limit: 18, null: false
    t.string   "student_code",          limit: 14, null: false
    t.date     "input_date_univercity"
    t.datetime "last_login_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
