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

ActiveRecord::Schema.define(version: 20140914213555) do

  create_table "artworks", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "artworks", ["user_id"], name: "index_artworks_on_user_id"

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_1_file_name"
    t.string   "picture_1_content_type"
    t.integer  "picture_1_file_size"
    t.datetime "picture_1_updated_at"
    t.string   "picture_2_file_name"
    t.string   "picture_2_content_type"
    t.integer  "picture_2_file_size"
    t.datetime "picture_2_updated_at"
    t.string   "artists"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "current",                default: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "slug"
    t.boolean  "admin",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
