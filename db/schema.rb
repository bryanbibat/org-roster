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

ActiveRecord::Schema.define(:version => 20100210120935) do

  create_table "batches", :force => true do |t|
    t.string   "name"
    t.integer  "applicant_batch"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committees", :force => true do |t|
    t.string   "code",         :null => false
    t.string   "full_name",    :null => false
    t.integer  "year_added",   :null => false
    t.integer  "year_removed"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "committee_id", :null => false
    t.integer  "role_id",      :null => false
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "committee_id", :null => false
    t.text     "description"
    t.boolean  "execom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_parameters", :force => true do |t|
    t.string   "code"
    t.string   "null"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "first_name",        :null => false
    t.string   "last_name",         :null => false
    t.integer  "batch_id"
    t.integer  "buddy_id"
    t.string   "picture_url"
    t.string   "status"
    t.string   "nickname"
    t.text     "other_aliases"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "plurk"
    t.string   "multiply"
    t.string   "livejournal"
    t.string   "tumblr"
    t.string   "linkedin"
  end

end
