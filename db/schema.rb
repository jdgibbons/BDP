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

ActiveRecord::Schema.define(version: 20140417064400) do

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "contacts", ["customer_id"], name: "index_contacts_on_customer_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipmental_line_items", force: true do |t|
    t.integer  "equipmental_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "quantity"
  end

  add_index "equipmental_line_items", ["equipmental_id"], name: "index_equipmental_line_items_on_equipmental_id", using: :btree
  add_index "equipmental_line_items", ["order_id"], name: "index_equipmental_line_items_on_order_id", using: :btree

  create_table "equipmentals", force: true do |t|
    t.string   "name"
    t.decimal  "rate",       precision: 10, scale: 0
    t.string   "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidentals", force: true do |t|
    t.string   "description"
    t.decimal  "cost",        precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labor_line_items", force: true do |t|
    t.integer  "labor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "quantity"
  end

  add_index "labor_line_items", ["labor_id"], name: "index_labor_line_items_on_labor_id", using: :btree
  add_index "labor_line_items", ["order_id"], name: "index_labor_line_items_on_order_id", using: :btree

  create_table "labors", force: true do |t|
    t.string   "name"
    t.decimal  "rate",       precision: 10, scale: 0
    t.string   "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_line_items", force: true do |t|
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "quantity"
  end

  add_index "material_line_items", ["material_id"], name: "index_material_line_items_on_material_id", using: :btree
  add_index "material_line_items", ["order_id"], name: "index_material_line_items_on_order_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "unit_type"
    t.decimal  "unit_price", precision: 10, scale: 0
    t.string   "notes"
    t.decimal  "roll_cost",  precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "work_order_id"
    t.integer  "invoice_id"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

end
