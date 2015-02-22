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

ActiveRecord::Schema.define(version: 20150222131048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "filter_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "filter_names", ["category_id"], name: "index_filter_names_on_category_id", using: :btree

  create_table "filter_values", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "filter_name_id"
  end

  add_index "filter_values", ["filter_name_id"], name: "index_filter_values_on_filter_name_id", using: :btree

  create_table "filter_values_sub_products", id: false, force: :cascade do |t|
    t.integer "filter_value_id"
    t.integer "sub_product_id"
  end

  add_index "filter_values_sub_products", ["filter_value_id", "sub_product_id"], name: "filter_values_sub_products_index", unique: true, using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "sub_product_id"
    t.integer  "order_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["sub_product_id"], name: "index_order_items_on_sub_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.text     "info"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.text     "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods_shipping_methods", id: false, force: :cascade do |t|
    t.integer "payment_method_id"
    t.integer "shipping_method_id"
  end

  add_index "payment_methods_shipping_methods", ["payment_method_id", "shipping_method_id"], name: "payment_methods_shipping_methods_index", unique: true, using: :btree

  create_table "product_pics", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
  end

  add_index "product_pics", ["product_id"], name: "index_product_pics_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "small_text"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "shipping_methods", force: :cascade do |t|
    t.text     "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sub_products", ["product_id"], name: "index_sub_products_on_product_id", using: :btree

  create_table "uploaded_files", force: :cascade do |t|
    t.string   "title"
    t.string   "file"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "product_pics", "products"
end
