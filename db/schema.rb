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

ActiveRecord::Schema[7.1].define(version: 2024_06_27_164856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "normal_user_id"
    t.string "name"
    t.string "address_line"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normal_user_id"], name: "index_addresses_on_normal_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "normal_user_id"
    t.string "favoritable_type"
    t.bigint "favoritable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["normal_user_id"], name: "index_favorites_on_normal_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "kind"
    t.boolean "purge", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.boolean "is_active", default: true
    t.boolean "is_featured", default: false
    t.decimal "average_rating", precision: 3, scale: 1, default: "0.0"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normal_user_tokens", force: :cascade do |t|
    t.bigint "normal_user_id"
    t.text "access_token"
    t.text "refresh_token"
    t.datetime "datetime_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normal_user_id"], name: "index_normal_user_tokens_on_normal_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "normal_user_id"
    t.bigint "location_id"
    t.decimal "total_price", precision: 10, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["normal_user_id"], name: "index_orders_on_normal_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "location_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_product_categories_on_location_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "product_category_id"
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_products_on_location_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "normal_user_id"
    t.bigint "location_id", null: false
    t.integer "score", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_reviews_on_location_id"
    t.index ["normal_user_id"], name: "index_reviews_on_normal_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.string "timezone", default: "Central Time (US & Canada)"
    t.string "locale", default: "en"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users", column: "normal_user_id"
  add_foreign_key "favorites", "users", column: "normal_user_id"
  add_foreign_key "normal_user_tokens", "users", column: "normal_user_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "users", column: "normal_user_id"
  add_foreign_key "product_categories", "locations"
  add_foreign_key "products", "locations"
  add_foreign_key "products", "product_categories"
  add_foreign_key "reviews", "locations"
  add_foreign_key "reviews", "users", column: "normal_user_id"
end
