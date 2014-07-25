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

ActiveRecord::Schema.define(version: 20140721213013) do

  create_table "action_zone_person_relations", id: false, force: true do |t|
    t.integer "person_id"
    t.integer "action_zone_id"
  end

  add_index "action_zone_person_relations", ["action_zone_id", "person_id"], name: "index_action_zone_person_relations", unique: true, using: :btree

  create_table "action_zones", primary_key: "Id", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "address_conceptualization_relations", id: false, force: true do |t|
    t.integer "address_id"
    t.integer "conceptualization_id"
  end

  add_index "address_conceptualization_relations", ["address_id", "conceptualization_id"], name: "index_address_conceptualization_relations", unique: true, using: :btree

  create_table "address_link_kinds", primary_key: "Id", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "address_person_relations", id: false, force: true do |t|
    t.integer "person_id"
    t.integer "address_id"
    t.integer "address_link_kind_id"
  end

  add_index "address_person_relations", ["person_id", "address_id", "address_link_kind_id"], name: "index_address_person_relations", unique: true, using: :btree

  create_table "address_sector_relations", primary_key: "Id", force: true do |t|
    t.integer "address_id"
    t.integer "sector_id"
    t.integer "percentage"
    t.string  "detail",     limit: 50
  end

  add_index "address_sector_relations", ["address_id"], name: "index_address_sector_relations_on_address_id", using: :btree
  add_index "address_sector_relations", ["sector_id"], name: "index_address_sector_relations_on_sector_id", using: :btree

  create_table "address_zone_relations", id: false, force: true do |t|
    t.integer "address_id"
    t.integer "zone_id"
  end

  add_index "address_zone_relations", ["address_id", "zone_id"], name: "index_address_zone_relations_on_address_id_and_zone_id", unique: true, using: :btree

  create_table "addresses", primary_key: "Id", force: true do |t|
    t.integer "address_type_id"
    t.string  "number",          limit: 20
    t.string  "between",         limit: 15
    t.string  "street",          limit: 10
    t.text    "notes",           limit: 2147483647
  end

  add_index "addresses", ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree

  create_table "attach_details", primary_key: "attach_id", force: true do |t|
    t.string  "from"
    t.text    "details", limit: 2147483647
    t.integer "id"
  end

  add_index "attach_details", ["id"], name: "index_attach_details_on_id", unique: true, using: :btree

  create_table "attach_types", primary_key: "Id", force: true do |t|
    t.string "name", limit: 50
  end

  create_table "attaches", primary_key: "Id", force: true do |t|
    t.integer "attach_type_id"
    t.string  "file",           limit: 50
    t.string  "title",          limit: 100
    t.integer "something"
    t.integer "something2"
    t.string  "Portada",        limit: 4
  end

  add_index "attaches", ["attach_type_id"], name: "index_attaches_on_attach_type_id", using: :btree

  create_table "cities", primary_key: "Id", force: true do |t|
    t.string  "name",         limit: 50
    t.integer "IdPrecedente"
  end

  create_table "conceptualization_person_relations", id: false, force: true do |t|
    t.integer "person_id"
    t.integer "conceptualization_id"
  end

  add_index "conceptualization_person_relations", ["person_id", "conceptualization_id"], name: "index_conceptualization_person_relations", unique: true, using: :btree

  create_table "conceptualizations", primary_key: "Id", force: true do |t|
    t.string "name", limit: 50
  end

  create_table "countries", primary_key: "Id", force: true do |t|
    t.string "name", limit: 50
  end

  create_table "identification_types", primary_key: "Id", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "identifications", force: true do |t|
    t.integer "person_id"
    t.integer "identification_type_id"
    t.string  "number",                 limit: 50
  end

  add_index "identifications", ["number"], name: "index_identifications_on_number", using: :btree
  add_index "identifications", ["person_id"], name: "index_identifications_on_person_id", using: :btree

  create_table "investigation_categories", primary_key: "Id", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "investigation_person_relations", id: false, force: true do |t|
    t.integer "investigation_id"
    t.integer "person_id"
  end

  add_index "investigation_person_relations", ["investigation_id", "person_id"], name: "index_investigation_person_relations", unique: true, using: :btree

  create_table "investigation_statuses", primary_key: "Id", force: true do |t|
    t.string "name", limit: 15
  end

  create_table "investigation_vehicle_relations", id: false, force: true do |t|
    t.integer "investigation_id"
    t.integer "vehicle_id"
  end

  add_index "investigation_vehicle_relations", ["investigation_id", "vehicle_id"], name: "index_investigation_vehicle_relations", unique: true, using: :btree

  create_table "investigations", primary_key: "Id", force: true do |t|
    t.integer  "investigation_status_id",                    null: false
    t.integer  "category_id",                                null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title",                   limit: 120,        null: false
    t.text     "detail",                  limit: 2147483647
    t.date     "FEdicion"
    t.date     "FCreaccion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investigations", ["category_id"], name: "index_investigations_on_category_id", using: :btree
  add_index "investigations", ["investigation_status_id"], name: "index_investigations_on_investigation_status_id", using: :btree

  create_table "people", primary_key: "Id", force: true do |t|
    t.string  "first_name", limit: 50
    t.string  "last_name",  limit: 30
    t.string  "Apellido_2", limit: 30
    t.date    "birthday"
    t.string  "father",     limit: 30
    t.string  "mother",     limit: 30
    t.text    "notes",      limit: 2147483647
    t.string  "record",     limit: 20
    t.integer "IdSexo"
    t.boolean "sex",                           default: false
    t.string  "alias"
  end

  create_table "people_relation_kinds", primary_key: "Id", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "person_addresses", primary_key: "Id", force: true do |t|
    t.integer "person_id"
    t.integer "IdTipoVinculo"
    t.integer "country_id"
    t.integer "province_id"
    t.integer "city_id"
    t.string  "CalleYNumero",  limit: 70
    t.integer "district_id"
    t.string  "street_name"
    t.string  "street_number"
  end

  add_index "person_addresses", ["city_id"], name: "index_person_addresses_on_city_id", using: :btree
  add_index "person_addresses", ["country_id"], name: "index_person_addresses_on_country_id", using: :btree
  add_index "person_addresses", ["district_id"], name: "index_person_addresses_on_district_id", using: :btree
  add_index "person_addresses", ["person_id"], name: "index_person_addresses_on_person_id", using: :btree
  add_index "person_addresses", ["province_id"], name: "index_person_addresses_on_province_id", using: :btree

  create_table "person_person_relations", primary_key: "Id", force: true do |t|
    t.integer "person_1_id"
    t.integer "person_2_id"
    t.integer "link_type_id"
    t.date    "since_date"
    t.date    "until_date"
  end

  add_index "person_person_relations", ["person_1_id", "person_2_id", "link_type_id"], name: "index_person_person_relations", unique: true, using: :btree

  create_table "person_physical_feature", force: true do |t|
    t.integer "person_id"
    t.integer "physical_feature_id"
  end

  add_index "person_physical_feature", ["person_id", "physical_feature_id"], name: "index_people_physical_features_relation", unique: true, using: :btree

  create_table "person_quadrant_link_kinds", primary_key: "Id", force: true do |t|
    t.string "name", limit: 25
  end

  create_table "phones", primary_key: "Id", force: true do |t|
    t.integer "person_id"
    t.string  "phone",     limit: 18
    t.string  "details",   limit: 50
  end

  add_index "phones", ["person_id"], name: "index_phones_on_person_id", using: :btree

  create_table "physical_features", primary_key: "ID", force: true do |t|
    t.string "name", limit: 25
  end

  create_table "provinces", primary_key: "Id", force: true do |t|
    t.string  "name",       limit: 30
    t.integer "country_id"
  end

  create_table "quadrants", primary_key: "Id", force: true do |t|
    t.string "name", limit: 20
  end

  create_table "sectors", primary_key: "Id", force: true do |t|
    t.string "name", limit: 20
  end

  create_table "towns", primary_key: "Id", force: true do |t|
    t.string  "name",    limit: 50
    t.integer "city_id"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "roles_mask",             default: 0,  null: false
    t.integer  "lock_version",           default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["lastname"], name: "index_users_on_lastname", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["whodunnit"], name: "index_versions_on_whodunnit", using: :btree

  create_table "zones", primary_key: "Id", force: true do |t|
    t.string "name", limit: 25
  end

end
