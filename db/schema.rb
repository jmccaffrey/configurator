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

ActiveRecord::Schema.define(version: 20140612212544) do

  create_table "modified_values", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "status"
    t.integer  "organization_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modified_values", ["organization_id"], name: "index_modified_values_on_organization_id"
  add_index "modified_values", ["service_id"], name: "index_modified_values_on_service_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "office_type"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "organizations", ["organization_id"], name: "index_organizations_on_organization_id"

  create_table "service_default_values", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "status"
    t.string   "data_type"
    t.string   "deleted_at"
    t.string   "expired_at"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_default_values", ["service_id"], name: "index_service_default_values_on_service_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end