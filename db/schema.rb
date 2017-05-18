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

ActiveRecord::Schema.define(version: 20161222173615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.boolean  "billing"
    t.boolean  "shipping"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: true do |t|
    t.string   "cardholder"
    t.string   "number"
    t.date     "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_carts", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_carts", ["product_id"], name: "index_product_carts_on_product_id", using: :btree
  add_index "product_carts", ["user_id"], name: "index_product_carts_on_user_id", using: :btree

  create_table "product_orders", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numbers"
  end

  add_index "product_orders", ["product_id"], name: "index_product_orders_on_product_id", using: :btree
  add_index "product_orders", ["user_id"], name: "index_product_orders_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "user_addresses", force: true do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["address_id"], name: "index_user_addresses_on_address_id", using: :btree
  add_index "user_addresses", ["user_id"], name: "index_user_addresses_on_user_id", using: :btree

  create_table "user_credit_cards", force: true do |t|
    t.integer  "user_id"
    t.integer  "credit_card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_credit_cards", ["credit_card_id"], name: "index_user_credit_cards_on_credit_card_id", using: :btree
  add_index "user_credit_cards", ["user_id"], name: "index_user_credit_cards_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
