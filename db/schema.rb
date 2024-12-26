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

ActiveRecord::Schema[7.0].define(version: 2024_12_22_090632) do
  create_table "articles", charset: "utf8mb3", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "item_name", null: false
    t.text "description", null: false
    t.integer "category_id", null: false
    t.integer "status_id", null: false
    t.integer "shipping_cost_id", null: false
    t.integer "prefecture_id", null: false
    t.integer "shipping_date_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sold"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "shippings", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "postcode", null: false
    t.string "prefecture_id", null: false
    t.string "city", null: false
    t.string "block", null: false
    t.string "building"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shippings_on_order_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "users"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users"
  add_foreign_key "shippings", "orders"
end
