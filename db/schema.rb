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

ActiveRecord::Schema.define(version: 20141021143100) do

  create_table "companies", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devisions", force: true do |t|
    t.integer  "leader_user_id"
    t.string   "name",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mission_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.integer  "companion_id"
    t.integer  "mission_type_id"
    t.string   "title",                           null: false
    t.string   "contents"
    t.integer  "nes_work_time",       default: 0, null: false
    t.integer  "unnes_work_time_min", default: 0, null: false
    t.integer  "unnes_work_time_max", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_recodes", force: true do |t|
    t.integer  "user_id"
    t.integer  "salary",     default: 0, null: false
    t.integer  "welfare",    default: 0, null: false
    t.integer  "carfare",    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name",           null: false
    t.integer  "leader_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_missions", force: true do |t|
    t.integer  "mission_id"
    t.integer  "user_id"
    t.integer  "unit_cost",              default: 0, null: false
    t.date     "start_date",                         null: false
    t.integer  "period",                 default: 0, null: false
    t.integer  "limit_over_cost_lower",  default: 0, null: false
    t.integer  "limit_over_cost_higher", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "devision_id"
    t.integer  "section_id"
    t.string   "name",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
