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

ActiveRecord::Schema.define(version: 20170622043834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string "name"
    t.string "good_for"
    t.string "description"
    t.string "photo"
    t.bigint "users_id"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_acts_on_user_id"
    t.index ["users_id"], name: "index_acts_on_users_id"
  end

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "time"
    t.string "address"
    t.bigint "users_id"
    t.bigint "acts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "booking_status"
    t.bigint "user_id"
    t.bigint "act_id"
    t.index ["act_id"], name: "index_bookings_on_act_id"
    t.index ["acts_id"], name: "index_bookings_on_acts_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "bio"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acts", "users"
  add_foreign_key "bookings", "acts"
  add_foreign_key "bookings", "acts", column: "acts_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "users", column: "users_id"
end
