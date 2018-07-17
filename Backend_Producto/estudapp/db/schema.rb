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

ActiveRecord::Schema.define(version: 20180717210326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "state"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "identification"
    t.string   "mail"
    t.integer  "rol_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["rol_id"], name: "index_clients_on_rol_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_courses_on_category_id", using: :btree
  end

  create_table "installs", force: :cascade do |t|
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
    t.index ["email"], name: "index_installs_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true, using: :btree
  end

  create_table "pre_registrations", force: :cascade do |t|
    t.datetime "schedule_course"
    t.string   "state"
    t.integer  "user_id"
    t.integer  "schedule_course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["schedule_course_id"], name: "index_pre_registrations_on_schedule_course_id", using: :btree
    t.index ["user_id"], name: "index_pre_registrations_on_user_id", using: :btree
  end

  create_table "rols", force: :cascade do |t|
    t.string   "state"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_courses", force: :cascade do |t|
    t.string   "quota"
    t.datetime "start_time"
    t.decimal  "price"
    t.string   "state"
    t.datetime "final_time"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_schedule_courses_on_course_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "interest"
    t.string   "commentary"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_surveys_on_user_id", using: :btree
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "clients", "rols"
  add_foreign_key "courses", "categories"
  add_foreign_key "pre_registrations", "schedule_courses"
  add_foreign_key "pre_registrations", "users"
  add_foreign_key "schedule_courses", "courses"
  add_foreign_key "surveys", "users"
end
