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

ActiveRecord::Schema.define(version: 2019_02_17_171348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "announcement_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "announcement_image_file_name"
    t.string "announcement_image_content_type"
    t.bigint "announcement_image_file_size"
    t.datetime "announcement_image_updated_at"
    t.string "pdf_file_name"
    t.string "pdf_content_type"
    t.bigint "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string "pdf_title"
  end

  create_table "artworks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_artworks_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "event_date"
    t.time "start_time"
    t.time "end_time"
    t.string "url"
    t.boolean "on_homepage", default: false
    t.string "event_image_file_name"
    t.string "event_image_content_type"
    t.bigint "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.string "pdf_file_name"
    t.string "pdf_content_type"
    t.bigint "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string "pdf_title"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "picture_1_file_name"
    t.string "picture_1_content_type"
    t.bigint "picture_1_file_size"
    t.datetime "picture_1_updated_at"
    t.string "picture_2_file_name"
    t.string "picture_2_content_type"
    t.bigint "picture_2_file_size"
    t.datetime "picture_2_updated_at"
    t.string "artists"
    t.date "start_date"
    t.date "end_date"
    t.boolean "current", default: false
    t.string "third_thursday_talk_title"
    t.datetime "third_thursday_talk_date"
    t.string "video_link"
    t.string "video_link_title"
    t.string "picture_1_caption"
    t.string "picture_2_caption"
    t.text "short_description"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_digest"
    t.string "remember_token"
    t.string "pic_file_name"
    t.string "pic_content_type"
    t.integer "pic_file_size"
    t.datetime "pic_updated_at"
    t.string "slug"
    t.boolean "admin", default: false
    t.string "website"
    t.bigint "primary_artwork_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["primary_artwork_id"], name: "index_users_on_primary_artwork_id"
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["slug"], name: "index_users_on_slug"
  end

  add_foreign_key "users", "artworks", column: "primary_artwork_id", on_delete: :nullify
end
