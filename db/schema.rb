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

ActiveRecord::Schema.define(version: 20140407231151) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.decimal  "rate",       precision: 10, scale: 0
    t.string   "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labors", force: true do |t|
    t.string   "name"
    t.decimal  "rate",       precision: 10, scale: 0
    t.string   "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "unit_type"
    t.decimal  "unit_price", precision: 10, scale: 0
    t.string   "notes"
    t.decimal  "roll_cost",  precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
