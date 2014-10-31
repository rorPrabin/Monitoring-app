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

ActiveRecord::Schema.define(version: 20140523082132) do

  create_table "activities", force: true do |t|
    t.string   "object"
    t.string   "object_type"
    t.text     "activity"
    t.text     "activity_type"
    t.string   "agent"
    t.datetime "time_stamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "object_id"
    t.integer  "agent_id"
    t.integer  "project_id"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "email_format"
    t.boolean  "allow_email_regex",  default: false
    t.string   "creator_name"
  end

  create_table "monitoring_tables", force: true do |t|
    t.integer  "project_id"
    t.string   "project_url"
    t.string   "project_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "response_time"
  end

  create_table "perferances", force: true do |t|
    t.integer  "user_id"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "p_type"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "company_id"
    t.integer  "creator_id"
    t.string   "token"
  end

  create_table "projects_users", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "company_id"
    t.boolean  "company_admin",          default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin",                  default: false, null: false
    t.string   "role"
    t.string   "token"
    t.integer  "creator_id"
    t.string   "creator_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
