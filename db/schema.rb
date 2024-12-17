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

<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
ActiveRecord::Schema[7.0].define(version: 2024_12_14_023848) do
  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.bigint "user_id", null: false
<<<<<<< Updated upstream
=======
ActiveRecord::Schema[7.0].define(version: 2024_12_16_142930) do
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
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
  create_table "shippings", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_shippings_on_item_id"
    t.index ["user_id"], name: "index_shippings_on_user_id"
  end

>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
  add_foreign_key "shippings", "items"
  add_foreign_key "shippings", "users"
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
end
