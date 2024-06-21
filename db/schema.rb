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

ActiveRecord::Schema[7.0].define(version: 2024_06_21_094727) do
  create_table "bids", force: :cascade do |t|
    t.decimal "amount"
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.decimal "maximum_bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_bids_on_item_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "starting_price"
    t.integer "seller_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal "minimum_selling_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.index "\"winner_d\"", name: "index_items_on_winner_d"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "items"
  add_foreign_key "bids", "users"
  add_foreign_key "items", "users", column: "seller_id"
end
