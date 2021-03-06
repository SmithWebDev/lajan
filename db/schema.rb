# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_02_28_094805) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.text "description"
    t.integer "cik"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dividend_histories", force: :cascade do |t|
    t.float "amount"
    t.datetime "declared_date"
    t.datetime "exdate"
    t.string "frequency"
    t.datetime "payment_date"
    t.datetime "record_date"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_dividend_histories_on_company_id"
  end

  create_table "price_history_monthlies", force: :cascade do |t|
    t.float "open", null: false
    t.float "low", null: false
    t.float "high", null: false
    t.float "close", null: false
    t.float "adjusted_close", null: false
    t.bigint "volume", null: false
    t.datetime "date", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dividend_amount", null: false
    t.index ["company_id"], name: "index_price_history_monthlies_on_company_id"
  end

  create_table "price_history_weeklies", force: :cascade do |t|
    t.float "open", null: false
    t.float "high", null: false
    t.float "low", null: false
    t.float "close", null: false
    t.float "adjusted_close", null: false
    t.bigint "volume", null: false
    t.datetime "date", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dividend_amount", null: false
    t.index ["company_id"], name: "index_price_history_weeklies_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dividend_histories", "companies"
  add_foreign_key "price_history_monthlies", "companies"
  add_foreign_key "price_history_weeklies", "companies"
end
