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

ActiveRecord::Schema.define(version: 20160122063522) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "prototype_id",      limit: 4
    t.text     "comment",           limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "soft_destroyed_at"
  end

  add_index "comments", ["prototype_id"], name: "index_comments_on_prototype_id", using: :btree
  add_index "comments", ["soft_destroyed_at"], name: "index_comments_on_soft_destroyed_at", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "prototype_id", limit: 4
    t.integer  "image_type",   limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "prototype_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "likes", ["prototype_id"], name: "index_likes_on_prototype_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "prototypes", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "title",             limit: 255
    t.string   "catchcopy",         limit: 255
    t.text     "concept",           limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "soft_destroyed_at"
    t.integer  "likes_count",       limit: 4
  end

  add_index "prototypes", ["soft_destroyed_at"], name: "index_prototypes_on_soft_destroyed_at", using: :btree
  add_index "prototypes", ["user_id"], name: "index_prototypes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.text     "profile",                limit: 65535
    t.string   "occupation",             limit: 255
    t.string   "position",               limit: 255
    t.string   "username",               limit: 255
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "prototypes"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "prototypes"
  add_foreign_key "likes", "users"
  add_foreign_key "prototypes", "users"
end
