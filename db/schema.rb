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

ActiveRecord::Schema.define(version: 2019_02_15_141714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "ref_no"
    t.string "market"
    t.boolean "status"
    t.integer "serial_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "code", limit: 20, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "contracts", id: :serial, force: :cascade do |t|
    t.string "language_code", limit: 255, null: false
    t.string "details", limit: 255, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "customer_responses", id: :serial, force: :cascade do |t|
    t.string "opencell_account_reference", limit: 255, null: false
    t.string "opencell_account_name", limit: 255, null: false
    t.string "signature_url", limit: 255, null: false
    t.string "market_code", limit: 255, null: false
    t.string "agent_detail", limit: 255, null: false
    t.string "additional_info", limit: 255, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "customers", force: :cascade do |t|
    t.string "ref_no"
    t.string "market"
    t.boolean "status"
    t.integer "serial_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defaulting_customer_reasons", id: :serial, force: :cascade do |t|
    t.string "opencell_account_reference", limit: 255, null: false
    t.string "opencell_account_name", limit: 255, null: false
    t.integer "no_payment_reason_id", null: false
    t.string "market_code", limit: 255, null: false
    t.string "agent_detal", limit: 255, null: false
    t.string "additional_info", limit: 255, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "logs", id: :serial, force: :cascade do |t|
    t.string "request", limit: 255, null: false
    t.string "response", limit: 255, null: false
    t.string "IP", limit: 255, null: false
    t.string "URL", limit: 255, null: false
    t.string "tag", limit: 255, null: false
    t.string "applicationId", limit: 255, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "markets", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.string "number_code", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.string "seller_code", limit: 255, null: false
    t.integer "last_customer_id", null: false
    t.integer "last_account_id", null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
    t.index ["code"], name: "markets_code_unique", unique: true
    t.index ["number_code"], name: "markets_number_code_unique", unique: true
  end

  create_table "migrations", id: :serial, force: :cascade do |t|
    t.string "migration", limit: 255, null: false
    t.integer "batch", null: false
  end

  create_table "no_payments", id: :serial, force: :cascade do |t|
    t.string "reason", limit: 255, null: false
    t.string "code", limit: 20, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "password_resets", id: false, force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "token", limit: 255, null: false
    t.datetime "created_at", precision: 0
    t.index ["email"], name: "password_resets_email_index"
  end

  create_table "shops", id: :serial, force: :cascade do |t|
    t.integer "zoneId", null: false
    t.string "sub_zone_code", limit: 20, null: false
    t.string "sub_zone_name", limit: 50, null: false
    t.string "shop_code", limit: 20, null: false
    t.string "shop_name", limit: 50, null: false
    t.string "meter_id", limit: 50, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "password", limit: 255, null: false
    t.string "remember_token", limit: 100
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.index ["email"], name: "users_email_unique", unique: true
  end

  create_table "zones", id: :serial, force: :cascade do |t|
    t.integer "marketId", null: false
    t.string "zone_code", limit: 20, null: false
    t.string "zone_name", limit: 200, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.datetime "deleted_at", precision: 0
  end

  add_foreign_key "defaulting_customer_reasons", "no_payments", column: "no_payment_reason_id", name: "defaulting_customer_reasons_no_payment_reason_id_foreign"
  add_foreign_key "shops", "zones", column: "zoneId", name: "shops_zoneid_foreign"
  add_foreign_key "zones", "markets", column: "marketId", name: "zones_marketid_foreign"
end
