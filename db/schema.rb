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

ActiveRecord::Schema[7.0].define(version: 2023_02_22_113200) do
  create_table "loans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "loan_id"
    t.integer "wallet_transaction_id"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_notifications_on_loan_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
    t.index ["wallet_transaction_id"], name: "index_notifications_on_wallet_transaction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.integer "wallet_id", null: false
    t.integer "loan_id", null: false
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_wallet_transactions_on_loan_id"
    t.index ["wallet_id"], name: "index_wallet_transactions_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

end
