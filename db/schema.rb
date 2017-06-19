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

ActiveRecord::Schema.define(version: 20170619021019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_reports", force: :cascade do |t|
    t.string   "title"
    t.string   "attendees"
    t.text     "area_status"
    t.text     "area_needs"
    t.text     "events"
    t.text     "news"
    t.text     "motions"
    t.text     "notes"
    t.integer  "area_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "created_by"
    t.string   "edited_by",   default: "N.A."
    t.decimal  "donation"
    t.index ["area_id"], name: "index_area_reports_on_area_id", using: :btree
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_groups_on_area_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "attendees"
    t.text     "old_business"
    t.text     "new_business"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "created_by"
    t.integer  "committee_id"
    t.index ["committee_id"], name: "index_reports_on_committee_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_committee_reports", force: :cascade do |t|
    t.string   "title"
    t.string   "attendees"
    t.text     "old_business"
    t.text     "new_business"
    t.text     "notes"
    t.string   "created_by"
    t.integer  "sub_committee_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "edited_by",        default: "N.A."
    t.index ["sub_committee_id"], name: "index_sub_committee_reports_on_sub_committee_id", using: :btree
  end

  create_table "sub_committees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "group_id"
    t.integer  "sub_committee_id"
    t.integer  "role_id",                default: 5
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["sub_committee_id"], name: "index_users_on_sub_committee_id", using: :btree
  end

  add_foreign_key "groups", "areas"
  add_foreign_key "reports", "sub_committees", column: "committee_id"
  add_foreign_key "sub_committee_reports", "sub_committees"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "sub_committees"
end
