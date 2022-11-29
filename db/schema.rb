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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_000909) do
  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.string "year"
  end

  create_table "budgets_details", force: :cascade do |t|
    t.integer "budget_id", null: false
    t.string "month"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budgets_details_on_budget_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_branch_relations", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_item_branch_relations_on_branch_id"
    t.index ["item_id"], name: "index_item_branch_relations_on_item_id"
  end

  create_table "item_factory_relations", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "factory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_id"], name: "index_item_factory_relations_on_factory_id"
    t.index ["item_id"], name: "index_item_factory_relations_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "large_classification"
    t.integer "small_classification"
    t.integer "component_n"
    t.integer "component_p"
    t.integer "component_k"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_details", force: :cascade do |t|
    t.integer "shipping_id", null: false
    t.string "month"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_id"], name: "index_shipping_details_on_shipping_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "budget_id"
    t.string "year"
    t.index ["user_id"], name: "index_shippings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets_details", "budgets"
  add_foreign_key "item_branch_relations", "branches"
  add_foreign_key "item_branch_relations", "items"
  add_foreign_key "item_factory_relations", "factories"
  add_foreign_key "item_factory_relations", "items"
  add_foreign_key "shipping_details", "shippings"
  add_foreign_key "shippings", "users"
end
