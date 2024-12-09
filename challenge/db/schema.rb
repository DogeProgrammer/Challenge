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

ActiveRecord::Schema[7.0].define(version: 2024_03_15_021646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_option_properties", force: :cascade do |t|
    t.integer "stock"
    t.float "price", null: false
    t.string "image", default: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-max-family-select?wid=4000&hei=3794&fmt=jpeg&qlt=90&.v=1692893974945"
    t.float "upfront", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_option_values", force: :cascade do |t|
    t.bigint "product_option_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_option_id"], name: "index_product_option_values_on_product_option_id"
  end

  create_table "product_option_values_product_option_properties", id: false, force: :cascade do |t|
    t.bigint "product_option_value_id", null: false
    t.bigint "product_option_property_id", null: false
    t.index ["product_option_property_id"], name: "index_pv_pp_on_pp_id"
    t.index ["product_option_value_id", "product_option_property_id"], name: "index_pv_pp_on_pv_id_and_pp_id", unique: true
    t.index ["product_option_value_id"], name: "index_pv_pp_on_pv_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.integer "option_type"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.float "upfront", null: false
    t.string "image", default: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-max-family-select?wid=4000&hei=3794&fmt=jpeg&qlt=90&.v=1692893974945"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category", null: false
    t.integer "stock", null: false
    t.float "discount"
    t.string "brand", null: false
  end

  add_foreign_key "product_option_values", "product_options"
  add_foreign_key "product_option_values_product_option_properties", "product_option_properties"
  add_foreign_key "product_option_values_product_option_properties", "product_option_values"
  add_foreign_key "product_options", "products"
end
