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

ActiveRecord::Schema.define(version: 20140725202345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_zone_person_relations", force: true do |t|
    t.integer  "person_id"
    t.integer  "action_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "action_zone_person_relations", ["action_zone_id", "person_id"], name: "action_zone_person_relations_action_zone_id_person_id_key", unique: true, using: :btree

  create_table "action_zones", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "address_conceptualization_relations", force: true do |t|
    t.integer  "address_id"
    t.integer  "conceptualization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_conceptualization_relations", ["address_id", "conceptualization_id"], name: "address_conceptualization_rel_address_id_conceptualization__key", unique: true, using: :btree

  create_table "address_link_kinds", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "address_person_relations", force: true do |t|
    t.integer  "person_id"
    t.integer  "address_id"
    t.integer  "address_link_kind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_person_relations", ["person_id", "address_id", "address_link_kind_id"], name: "address_person_relations_person_id_address_id_address_link__key", unique: true, using: :btree

  create_table "address_sector_relations", force: true do |t|
    t.integer  "address_id"
    t.integer  "sector_id"
    t.integer  "percentage"
    t.string   "detail",     limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "address_zone_relations", force: true do |t|
    t.integer  "address_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_zone_relations", ["address_id", "zone_id"], name: "address_zone_relations_address_id_zone_id_key", unique: true, using: :btree

  create_table "addresses", force: true do |t|
    t.integer  "address_type_id"
    t.string   "number"
    t.string   "between"
    t.string   "street"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attach_details", force: true do |t|
    t.string   "from",       limit: 510
    t.text     "details"
    t.integer  "attach_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attach_types", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attaches", force: true do |t|
    t.integer  "attach_type_id"
    t.string   "file",           limit: 100
    t.string   "title",          limit: 200
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",        limit: 100
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conceptualization_person_relations", force: true do |t|
    t.integer  "person_id"
    t.integer  "conceptualization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conceptualization_person_relations", ["person_id", "conceptualization_id"], name: "conceptualization_person_rela_person_id_conceptualization_i_key", unique: true, using: :btree

  create_table "conceptualizations", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identification_types", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identifications", force: true do |t|
    t.integer  "person_id"
    t.integer  "identification_type_id"
    t.string   "number",                 limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investigation_address_relations", force: true do |t|
    t.integer  "investigation_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investigation_address_relations", ["investigation_id", "address_id"], name: "investigation_address_relations_investigation_id_address_id_key", unique: true, using: :btree

  create_table "investigation_categories", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investigation_person_relations", force: true do |t|
    t.integer  "investigation_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investigation_person_relations", ["investigation_id", "person_id"], name: "investigation_person_relations_investigation_id_person_id_key", unique: true, using: :btree

  create_table "investigation_statuses", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investigations", force: true do |t|
    t.integer  "status_id",               null: false
    t.integer  "category_id",             null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title",       limit: 240, null: false
    t.text     "detail"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "people", force: true do |t|
    t.string   "first_name", limit: 100
    t.string   "last_name",  limit: 60
    t.date     "birthday"
    t.string   "father",     limit: 60
    t.string   "mother",     limit: 60
    t.text     "notes"
    t.boolean  "sex",                    default: false
    t.string   "alias",      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_relation_kinds", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_addresses", force: true do |t|
    t.integer  "person_id"
    t.integer  "address_id"
    t.integer  "country_id"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "zone_id"
    t.string   "street_name",   limit: 510
    t.string   "street_number", limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_person_relations", force: true do |t|
    t.integer  "person_1_id"
    t.integer  "person_2_id"
    t.integer  "link_kind_id"
    t.date     "since_date"
    t.date     "until_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_person_relations", ["person_1_id", "person_2_id", "link_kind_id"], name: "person_person_relations_person_1_id_person_2_id_link_type_i_key", unique: true, using: :btree

  create_table "person_physical_features", force: true do |t|
    t.integer  "person_id"
    t.integer  "physical_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_physical_features", ["person_id", "physical_feature_id"], name: "person_physical_features_person_id_physical_feature_id_key", unique: true, using: :btree

  create_table "person_quadrant_link_kinds", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: true do |t|
    t.integer  "person_id"
    t.string   "number",     limit: 36
    t.string   "details",    limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_features", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name",       limit: 60
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quadrants", force: true do |t|
    t.string   "name",       limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "name",       limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", force: true do |t|
    t.string   "name",       limit: 100
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                   limit: 510,              null: false
    t.string   "lastname",               limit: 510
    t.string   "email",                  limit: 510, default: "", null: false
    t.string   "encrypted_password",     limit: 510, default: "", null: false
    t.string   "reset_password_token",   limit: 510
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 510
    t.string   "last_sign_in_ip",        limit: 510
    t.integer  "roles_mask",                         default: 0,  null: false
    t.integer  "lock_version",                       default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "users_reset_password_token_key", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  limit: 510, null: false
    t.integer  "item_id",                null: false
    t.string   "event",      limit: 510, null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  create_table "zones", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
