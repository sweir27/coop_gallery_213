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

ActiveRecord::Schema.define(version: 20150425212344) do

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "announcement_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "announcement_image_file_name"
    t.string   "announcement_image_content_type"
    t.integer  "announcement_image_file_size"
    t.datetime "announcement_image_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "pdf_title"
  end

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

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "url"
    t.boolean  "on_homepage",              default: false
    t.string   "event_image_file_name"
    t.string   "event_image_content_type"
    t.integer  "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "pdf_title"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "name"
    t.text     "description"
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
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",                            default: false
    t.string   "artist_talk_title"
    t.datetime "artist_talk_date"
    t.string   "video_link"
    t.string   "video_link_title"
    t.string   "picture_1_caption"
    t.string   "picture_2_caption"
    t.text     "short_description",      limit: 500
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "biography"
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
    t.string   "website"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
