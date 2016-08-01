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

ActiveRecord::Schema.define(version: 20160801063758) do

  create_table "additional_educations", force: :cascade do |t|
    t.text     "academy"
    t.integer  "suit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "additional_educations", ["suit_id"], name: "index_additional_educations_on_suit_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "articlecategory_id"
    t.integer  "soul_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "articles", ["soul_id"], name: "index_articles_on_soul_id"

  create_table "educations", force: :cascade do |t|
    t.text     "college"
    t.integer  "suit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["suit_id"], name: "index_educations_on_suit_id"

  create_table "experiences", force: :cascade do |t|
    t.date     "startdate"
    t.string   "datecomment"
    t.date     "enddate"
    t.string   "title"
    t.text     "description"
    t.string   "workplaceurl"
    t.integer  "soul_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "experiences", ["soul_id"], name: "index_experiences_on_soul_id"

  create_table "hobbies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "hobbiescategory_id"
    t.integer  "soul_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "hobbies", ["soul_id"], name: "index_hobbies_on_soul_id"

  create_table "interested_ins", force: :cascade do |t|
    t.string   "futureskill"
    t.integer  "suit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "interested_ins", ["suit_id"], name: "index_interested_ins_on_suit_id"

  create_table "my_skills", force: :cascade do |t|
    t.string   "skill"
    t.integer  "suit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_skills", ["suit_id"], name: "index_my_skills_on_suit_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "team"
    t.string   "client"
    t.integer  "soul_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["soul_id"], name: "index_projects_on_soul_id"

  create_table "purposes", force: :cascade do |t|
    t.string   "purport"
    t.text     "description"
    t.string   "url"
    t.integer  "soul_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "purposes", ["soul_id"], name: "index_purposes_on_soul_id"

  create_table "quotations", force: :cascade do |t|
    t.string   "author"
    t.text     "proverb"
    t.text     "description"
    t.string   "datecomment"
    t.date     "created"
    t.integer  "soul_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "quotations", ["soul_id"], name: "index_quotations_on_soul_id"

  create_table "souls", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "nickname"
    t.date     "born"
    t.string   "city"
    t.string   "mob_number"
    t.string   "facebook"
    t.string   "github"
    t.string   "linkid"
    t.string   "skype"
    t.text     "history"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suits", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wishes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "wishescategory_id"
    t.integer  "soul_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "wishes", ["soul_id"], name: "index_wishes_on_soul_id"

end
