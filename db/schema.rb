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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111203024307) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boxes", :force => true do |t|
    t.string   "label"
    t.string   "value"
    t.string   "color"
    t.integer  "catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boxes", ["catalog_id"], :name => "index_boxes_on_catalog_id"

  create_table "calls", :force => true do |t|
    t.date     "date"
    t.string   "result"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calls", ["publisher_id"], :name => "index_calls_on_publisher_id"

  create_table "catalogs", :force => true do |t|
    t.date     "date"
    t.string   "issue"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catalogs", ["publisher_id"], :name => "index_catalogs_on_publisher_id"

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.boolean  "should_call"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publishers", ["user_id"], :name => "index_publishers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
