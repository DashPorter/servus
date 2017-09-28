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

ActiveRecord::Schema.define(version: 20170928195759) do

  create_table "dispatchers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "tow_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tow_company_id"], name: "index_dispatchers_on_tow_company_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "tow_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tow_company_id"], name: "index_drivers_on_tow_company_id"
  end

  create_table "tow_requests", force: :cascade do |t|
    t.string "starting_location"
    t.string "current_location"
    t.string "final_location"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending", null: false
    t.datetime "deleted_at"
    t.integer "tow_company_id"
    t.float "payment_amount"
    t.string "payment_status", default: ""
    t.index ["deleted_at"], name: "index_tow_requests_on_deleted_at"
    t.index ["driver_id"], name: "index_tow_requests_on_driver_id"
  end

  create_table "tow_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "type"
    t.integer "tow_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tow_company_id"], name: "index_tow_users_on_tow_company_id"
  end

  create_table "towing_companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "year"
    t.string "license_plate_number"
    t.integer "tow_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", default: ""
    t.string "start_photo", default: ""
    t.string "end_photo", default: ""
    t.string "color", default: ""
    t.string "license_plate_state", default: ""
    t.string "photos", default: ""
    t.index ["tow_request_id"], name: "index_vehicles_on_tow_request_id"
  end

end
