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

ActiveRecord::Schema.define(version: 2020_03_20_183753) do

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "doctorprofile_id"
    t.integer "patient_id"
    t.text "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctorprofile_id"], name: "index_appointments_on_doctorprofile_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "doctorprofiles", force: :cascade do |t|
    t.string "name"
    t.integer "contactNumber"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctorprofiles_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "contactNumber"
    t.string "address"
    t.string "gender"
    t.datetime "dob"
    t.string "ppsNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
