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

ActiveRecord::Schema.define(:version => 20120529162309) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.decimal  "price"
    t.integer  "state"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "table_id"
    t.integer  "restaurant_id"
  end

  create_table "invoices_products", :force => true do |t|
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "invoice_id"
    t.integer  "product_id"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "menus_products", :id => false, :force => true do |t|
    t.integer "menu_id"
    t.integer "product_id"
  end

  create_table "products", :force => true do |t|
    t.decimal  "price"
    t.string   "name"
    t.string   "abbreviation"
    t.text     "description"
    t.boolean  "permanent"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "category_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "name"
    t.string   "city"
    t.string   "phone"
    t.string   "address"
    t.integer  "restaurant_manager_id"
    t.integer  "postal_code"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "week"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "menu_id"
  end

  create_table "tables", :force => true do |t|
    t.string   "name"
    t.integer  "forks_nb"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
    t.integer  "zone_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "type"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "zipCode"
    t.string   "city"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "push_url"
    t.integer  "restaurant_id"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "waiter_id"
    t.integer  "restaurant_id"
  end

end
