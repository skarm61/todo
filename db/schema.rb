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

ActiveRecord::Schema.define(:version => 20130312140319) do

  create_table "emails", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "private"
  end

  create_table "news", :force => true do |t|
    t.string   "header"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.boolean  "is_done"
    t.integer  "list_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "vk_token"
    t.string   "login"
    t.string   "second_name"
    t.string   "url_for_vk_photo_medium"
    t.string   "id_vk"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
