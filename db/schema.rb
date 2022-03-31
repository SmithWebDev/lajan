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

ActiveRecord::Schema[7.0].define(version: 2022_03_31_162642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_holdings", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "shares"
    t.float "cost_per_share"
    t.index ["account_id"], name: "index_account_holdings_on_account_id"
    t.index ["company_id"], name: "index_account_holdings_on_company_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "account_name", default: "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.text "description"
    t.integer "cik"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exchange"
    t.string "sector"
    t.string "industry"
    t.date "fiscalyearend"
    t.date "latestquarter"
    t.bigint "ebitda"
    t.float "peratio"
    t.float "dividend_per_share"
    t.float "dividend_yield"
    t.float "eps"
    t.float "year_high"
    t.float "year_low"
    t.bigint "shares_outstanding"
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

  create_table "price_history_dailies", force: :cascade do |t|
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "close"
    t.bigint "volume"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["company_id"], name: "index_price_history_dailies_on_company_id"
  end

  create_table "price_history_monthlies", force: :cascade do |t|
    t.float "open", null: false
    t.float "low", null: false
    t.float "high", null: false
    t.float "close", null: false
    t.float "adjusted_close", null: false
    t.float "dividend_amount", null: false
    t.bigint "volume", null: false
    t.datetime "date", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_price_history_monthlies_on_company_id"
  end

  create_table "price_history_weeklies", force: :cascade do |t|
    t.float "open", null: false
    t.float "high", null: false
    t.float "low", null: false
    t.float "close", null: false
    t.float "adjusted_close", null: false
    t.float "dividend_amount", null: false
    t.bigint "volume", null: false
    t.datetime "date", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_holdings", "accounts"
  add_foreign_key "account_holdings", "companies"
  add_foreign_key "dividend_histories", "companies"
  add_foreign_key "price_history_dailies", "companies"
  add_foreign_key "price_history_monthlies", "companies"
  add_foreign_key "price_history_weeklies", "companies"
end
