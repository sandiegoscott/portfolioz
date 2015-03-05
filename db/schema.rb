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

ActiveRecord::Schema.define(version: 20140616230904) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "brokerage_id", limit: 4
    t.string   "name",         limit: 60
    t.decimal  "value",                   precision: 12, scale: 2, default: 0.0
    t.decimal  "cash",                    precision: 12, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brokerages", force: :cascade do |t|
    t.integer  "household_id", limit: 4
    t.string   "name",         limit: 60
    t.decimal  "cash",                    precision: 12, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holdings", force: :cascade do |t|
    t.integer  "account_id",    limit: 4
    t.integer  "investment_id", limit: 4
    t.decimal  "shares",                  precision: 12, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "households", force: :cascade do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "household_id", limit: 4
    t.string   "symbol",       limit: 20
    t.string   "name",         limit: 60, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer  "source_id",     limit: 4
    t.integer  "investment_id", limit: 4
    t.date     "ddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: :cascade do |t|
    t.integer  "household_id", limit: 4
    t.string   "name",         limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splits", force: :cascade do |t|
    t.integer  "investment_id", limit: 4
    t.date     "ddate"
    t.decimal  "shares_before",           precision: 12, scale: 5
    t.decimal  "shares_after",            precision: 12, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "investment_id", limit: 4
    t.integer  "account_id",    limit: 4
    t.integer  "holding_id",    limit: 4
    t.date     "ddate"
    t.decimal  "cash_delta",                precision: 12, scale: 2, default: 0.0
    t.decimal  "price",                     precision: 12, scale: 5
    t.decimal  "amount",                    precision: 12, scale: 2
    t.decimal  "commission",                precision: 12, scale: 2, default: 0.0
    t.decimal  "shares_delta",              precision: 12, scale: 5
    t.decimal  "shares",                    precision: 12, scale: 5
    t.decimal  "shares_before",             precision: 12, scale: 5
    t.decimal  "shares_after",              precision: 12, scale: 5
    t.string   "note",          limit: 140
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "household_id",           limit: 4
    t.integer  "role",                   limit: 4
    t.string   "name",                   limit: 30
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
