# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_03_074354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_wallets", force: :cascade do |t|
    t.integer "total_amount"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_wallets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.string "transaction_type"
    t.integer "credit_amt"
    t.integer "debit_amt"
    t.date "transaction_date"
    t.bigint "user_id"
    t.bigint "user_wallet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallet_transactions_on_user_id"
    t.index ["user_wallet_id"], name: "index_wallet_transactions_on_user_wallet_id"
  end

end
