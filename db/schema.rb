# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101018130521) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.string   "teaser"
    t.text     "body"
    t.boolean  "featured"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "published_date"
    t.string   "published_at"
    t.string   "article_photo_file_name"
    t.string   "article_photo_content_type"
    t.integer  "article_photo_file_size"
    t.datetime "article_photo_updated_at"
    t.string   "article_photo_caption"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_no"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", :force => true do |t|
    t.string   "developer"
    t.string   "permalink"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_ranges", :force => true do |t|
    t.string   "range"
    t.integer  "sort_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "developer_id",           :default => 0
    t.string   "name"
    t.string   "permalink"
    t.text     "address"
    t.string   "location"
    t.boolean  "completed",              :default => false
    t.string   "target_completion_date"
    t.text     "description"
    t.text     "unit_types"
    t.boolean  "studio"
    t.boolean  "one_bedroom"
    t.boolean  "two_bedroom"
    t.boolean  "three_bedroom"
    t.boolean  "penthouse"
    t.text     "unit_sizes"
    t.string   "studio_size"
    t.string   "one_bedroom_size"
    t.string   "two_bedroom_size"
    t.string   "three_bedroom_size"
    t.string   "penthouse_size"
    t.text     "price_range"
    t.string   "studio_price"
    t.string   "one_bedroom_price"
    t.string   "two_bedroom_price"
    t.string   "three_bedroom_price"
    t.string   "penthouse_price"
    t.text     "amenities"
    t.text     "unit_specifications"
    t.text     "payment_terms"
    t.string   "as_low_as"
    t.string   "reservation_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "production_email"
    t.text     "about_us"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
