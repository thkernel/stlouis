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

ActiveRecord::Schema.define(version: 2022_02_26_190114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "uid"
    t.string "login"
    t.string "slug"
    t.bigint "role_id", null: false
    t.string "status"
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_logs", force: :cascade do |t|
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.string "browser"
    t.string "ip_address"
    t.string "controller"
    t.string "action"
    t.string "params"
    t.string "note"
    t.index ["account_id"], name: "index_activity_logs_on_account_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token"
    t.bigint "account_id"
    t.datetime "expires_at"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_api_keys_on_account_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "cart_id"
    t.bigint "food_id"
    t.bigint "product_id"
    t.float "quantity", default: 0.0
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["food_id"], name: "index_cart_items_on_food_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "uid"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_carts_on_account_id"
  end

  create_table "customer_discounts", force: :cascade do |t|
    t.string "uid"
    t.bigint "customer_id"
    t.float "amount"
    t.string "status"
    t.bigint "account_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_customer_discounts_on_account_id"
    t.index ["customer_id"], name: "index_customer_discounts_on_customer_id"
  end

  create_table "customer_fidelity_cards", force: :cascade do |t|
    t.string "uid"
    t.bigint "customer_id"
    t.bigint "fidelity_card_id"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_customer_fidelity_cards_on_account_id"
    t.index ["customer_id"], name: "index_customer_fidelity_cards_on_customer_id"
    t.index ["fidelity_card_id"], name: "index_customer_fidelity_cards_on_fidelity_card_id"
  end

  create_table "customer_social_cases", force: :cascade do |t|
    t.string "uid"
    t.bigint "customer_id"
    t.integer "dish_number"
    t.bigint "time_unit_id"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_customer_social_cases_on_account_id"
    t.index ["customer_id"], name: "index_customer_social_cases_on_customer_id"
    t.index ["time_unit_id"], name: "index_customer_social_cases_on_time_unit_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "uid"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "po_box"
    t.string "zip_code"
    t.string "email"
    t.string "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_customers_on_account_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "subject_class"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fidelity_cards", force: :cascade do |t|
    t.string "uid"
    t.float "balance", default: 0.0
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_fidelity_cards_on_account_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_food_categories_on_account_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.bigint "food_category_id"
    t.string "name"
    t.time "min_cooking_time"
    t.time "max_cooking_time"
    t.float "price"
    t.string "descriptions"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_foods_on_account_id"
    t.index ["food_category_id"], name: "index_foods_on_food_category_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "uid"
    t.string "nature"
    t.bigint "recipient_id"
    t.text "content"
    t.string "status"
    t.datetime "readed_at"
    t.string "notificable_type"
    t.bigint "notificable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
  end

  create_table "order_item_drinks", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.float "quantity"
    t.float "unit_price"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_item_drinks_on_order_id"
    t.index ["product_id"], name: "index_order_item_drinks_on_product_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "order_id"
    t.bigint "food_id"
    t.float "quantity", default: 0.0
    t.float "price", default: 0.0
    t.float "amount", default: 0.0
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["food_id"], name: "index_order_items_on_food_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "uid"
    t.bigint "customer_id"
    t.bigint "table_id"
    t.float "subtotal", default: 0.0
    t.float "total", default: 0.0
    t.float "tax", default: 0.0
    t.float "shipping", default: 0.0
    t.string "status"
    t.string "paid"
    t.string "payment_method"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vip_space", default: false
    t.boolean "social_case", default: false
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "uid"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.text "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_partners_on_account_id"
  end

  create_table "permission_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "permission_id"
    t.string "action_name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permission_items_on_permission_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "uid"
    t.bigint "feature_id"
    t.bigint "role_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.string "name"
    t.string "description"
    t.bigint "account_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_product_categories_on_account_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "uid"
    t.string "slug"
    t.bigint "product_category_id"
    t.string "name"
    t.bigint "unity_id"
    t.string "bar_code"
    t.float "unit_price"
    t.bigint "provider_id"
    t.float "reorder_threshold"
    t.float "current_stock", default: 0.0
    t.string "description"
    t.bigint "account_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_products_on_account_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["provider_id"], name: "index_products_on_provider_id"
    t.index ["unity_id"], name: "index_products_on_unity_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "uid"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "po_box"
    t.string "zip_code"
    t.string "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_providers_on_account_id"
  end

  create_table "recharge_fidelity_cards", force: :cascade do |t|
    t.string "uid"
    t.bigint "fidelity_card_id"
    t.float "amount", default: 0.0
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_recharge_fidelity_cards_on_account_id"
    t.index ["fidelity_card_id"], name: "index_recharge_fidelity_cards_on_fidelity_card_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smtp_server_settings", force: :cascade do |t|
    t.string "uid"
    t.string "host_name"
    t.string "user_name"
    t.string "user_password"
    t.string "domain"
    t.integer "port"
    t.string "authentication"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_smtp_server_settings_on_account_id"
  end

  create_table "stock_entries", force: :cascade do |t|
    t.string "uid"
    t.bigint "product_id"
    t.string "reason"
    t.float "quantity", default: 0.0
    t.bigint "unity_id"
    t.text "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_stock_entries_on_account_id"
    t.index ["product_id"], name: "index_stock_entries_on_product_id"
    t.index ["unity_id"], name: "index_stock_entries_on_unity_id"
  end

  create_table "stock_exits", force: :cascade do |t|
    t.string "uid"
    t.bigint "product_id"
    t.string "reason"
    t.float "quantity", default: 0.0
    t.bigint "unity_id"
    t.text "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_stock_exits_on_account_id"
    t.index ["product_id"], name: "index_stock_exits_on_product_id"
    t.index ["unity_id"], name: "index_stock_exits_on_unity_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_tables_on_account_id"
  end

  create_table "technical_sheet_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "technical_sheet_id"
    t.bigint "product_id"
    t.bigint "unity_id"
    t.float "unity_purchase_cost_excl_tax", default: 0.0
    t.float "quantity", default: 0.0
    t.float "cost_price_excl_tax", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_technical_sheet_items_on_product_id"
    t.index ["technical_sheet_id"], name: "index_technical_sheet_items_on_technical_sheet_id"
    t.index ["unity_id"], name: "index_technical_sheet_items_on_unity_id"
  end

  create_table "technical_sheets", force: :cascade do |t|
    t.string "uid"
    t.bigint "food_id"
    t.float "portion_number", default: 0.0
    t.float "sale_price_incl_vat", default: 0.0
    t.float "vat_rate", default: 0.0
    t.float "total_cost_price_excl_tax", default: 0.0
    t.float "produced_portion_unit_cost_price_excl_tax", default: 0.0
    t.float "unsold_average_percentage", default: 0.0
    t.float "sold_portion_unit_cost_price_excl_vat", default: 0.0
    t.float "selling_price_excl_tax", default: 0.0
    t.float "gross_margin", default: 0.0
    t.float "margin_rate", default: 0.0
    t.float "margin_coefficient", default: 0.0
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_technical_sheets_on_account_id"
    t.index ["food_id"], name: "index_technical_sheets_on_food_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "uid"
    t.string "organization_name"
    t.string "address"
    t.string "phone"
    t.string "country"
    t.string "city"
    t.string "email"
    t.string "website"
    t.string "subdomain"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_tenants_on_account_id"
  end

  create_table "time_units", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "description"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_time_units_on_account_id"
  end

  create_table "unities", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "unity_symbol"
    t.text "decription"
    t.string "status"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_unities_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "roles"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_logs", "accounts"
  add_foreign_key "api_keys", "accounts"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "foods"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "accounts"
  add_foreign_key "customer_discounts", "accounts"
  add_foreign_key "customer_discounts", "customers"
  add_foreign_key "customer_fidelity_cards", "accounts"
  add_foreign_key "customer_fidelity_cards", "customers"
  add_foreign_key "customer_fidelity_cards", "fidelity_cards"
  add_foreign_key "customer_social_cases", "accounts"
  add_foreign_key "customer_social_cases", "customers"
  add_foreign_key "customer_social_cases", "time_units"
  add_foreign_key "customers", "accounts"
  add_foreign_key "fidelity_cards", "accounts"
  add_foreign_key "food_categories", "accounts"
  add_foreign_key "foods", "accounts"
  add_foreign_key "foods", "food_categories"
  add_foreign_key "order_item_drinks", "orders"
  add_foreign_key "order_item_drinks", "products"
  add_foreign_key "order_items", "foods"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "accounts"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "tables"
  add_foreign_key "partners", "accounts"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "product_categories", "accounts"
  add_foreign_key "products", "accounts"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "unities"
  add_foreign_key "providers", "accounts"
  add_foreign_key "recharge_fidelity_cards", "accounts"
  add_foreign_key "recharge_fidelity_cards", "fidelity_cards"
  add_foreign_key "smtp_server_settings", "accounts"
  add_foreign_key "stock_entries", "accounts"
  add_foreign_key "stock_entries", "products"
  add_foreign_key "stock_entries", "unities"
  add_foreign_key "stock_exits", "accounts"
  add_foreign_key "stock_exits", "products"
  add_foreign_key "stock_exits", "unities"
  add_foreign_key "tables", "accounts"
  add_foreign_key "technical_sheet_items", "products"
  add_foreign_key "technical_sheet_items", "technical_sheets"
  add_foreign_key "technical_sheet_items", "unities"
  add_foreign_key "technical_sheets", "accounts"
  add_foreign_key "technical_sheets", "foods"
  add_foreign_key "tenants", "accounts"
  add_foreign_key "time_units", "accounts"
  add_foreign_key "unities", "accounts"
end
