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

ActiveRecord::Schema.define(:version => 20110423001643) do

  create_table "alerts", :force => true do |t|
    t.string   "title",                          :null => false
    t.text     "description",                    :null => false
    t.date     "expire",                         :null => false
    t.boolean  "enabled",     :default => false
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "assets_lessons", :id => false, :force => true do |t|
    t.integer "asset_id",  :null => false
    t.integer "lesson_id", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.boolean  "enabled",     :default => true
    t.string   "workload"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["name"], :name => "index_courses_on_name", :unique => true

  create_table "courses_users", :id => false, :force => true do |t|
    t.integer "user_id",   :null => false
    t.integer "course_id", :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "theme"
    t.date     "date_at"
    t.text     "description"
    t.integer  "course_id"
    t.integer  "user_id"
    t.boolean  "enabled",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matriculations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "enabled",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "cellfone"
    t.string   "home_page"
    t.text     "profile"
    t.string   "role",                                                  :null => false
    t.boolean  "enabled",                             :default => true
    t.string   "email",                               :default => "",   :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",   :null => false
    t.string   "password_salt",                       :default => "",   :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"

end
