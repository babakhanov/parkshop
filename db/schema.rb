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

ActiveRecord::Schema.define(version: 20150124105705) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "filter_names", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
  end

  add_index "filter_names", ["category_id"], name: "index_filter_names_on_category_id", using: :btree

  create_table "filter_values", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "filter_name_id", limit: 4
  end

  add_index "filter_values", ["filter_name_id"], name: "index_filter_values_on_filter_name_id", using: :btree

  create_table "filter_values_sub_products", id: false, force: :cascade do |t|
    t.integer "filter_value_id", limit: 4
    t.integer "sub_product_id",  limit: 4
  end

  add_index "filter_values_sub_products", ["filter_value_id", "sub_product_id"], name: "filter_values_sub_products_index", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.text     "small_text",  limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "category_id", limit: 4
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "sub_products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "price",                  precision: 10
    t.integer  "product_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "sub_products", ["product_id"], name: "index_sub_products_on_product_id", using: :btree

end
