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

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.string "announcement_link", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "announcement_image_file_name", limit: 255
    t.string "announcement_image_content_type", limit: 255
    t.integer "announcement_image_file_size"
    t.datetime "announcement_image_updated_at"
    t.string "pdf_file_name", limit: 255
    t.string "pdf_content_type", limit: 255
    t.integer "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string "pdf_title", limit: 255
  end

  create_table "artworks", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_artworks_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "event_date"
    t.time "start_time"
    t.time "end_time"
    t.string "url", limit: 255
    t.boolean "on_homepage", default: false
    t.string "event_image_file_name", limit: 255
    t.string "event_image_content_type", limit: 255
    t.integer "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.string "pdf_file_name", limit: 255
    t.string "pdf_content_type", limit: 255
    t.integer "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string "pdf_title", limit: 255
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.string "title", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "picture_1_file_name", limit: 255
    t.string "picture_1_content_type", limit: 255
    t.integer "picture_1_file_size"
    t.datetime "picture_1_updated_at"
    t.string "picture_2_file_name", limit: 255
    t.string "picture_2_content_type", limit: 255
    t.integer "picture_2_file_size"
    t.datetime "picture_2_updated_at"
    t.string "artists", limit: 255
    t.date "start_date"
    t.date "end_date"
    t.boolean "current", default: false
    t.string "third_thursday_talk_title", limit: 255
    t.datetime "third_thursday_talk_date"
    t.string "video_link", limit: 255
    t.string "video_link_title", limit: 255
    t.string "picture_1_caption", limit: 255
    t.string "picture_2_caption", limit: 255
    t.text "short_description"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.text "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_digest", limit: 255
    t.string "remember_token", limit: 255
    t.string "pic_file_name", limit: 255
    t.string "pic_content_type", limit: 255
    t.integer "pic_file_size"
    t.datetime "pic_updated_at"
    t.string "slug", limit: 255
    t.boolean "admin", default: false
    t.string "website", limit: 255
    t.bigint "primary_artwork_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["primary_artwork_id"], name: "index_users_on_primary_artwork_id"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "users", "artworks", column: "primary_artwork_id", on_delete: :nullify
end
