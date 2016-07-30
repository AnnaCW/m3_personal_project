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

ActiveRecord::Schema.define(version: 20160729235243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listening_sessions", force: :cascade do |t|
    t.text     "notes"
    t.string   "item_name"
    t.string   "item_type"
    t.string   "item_id"
    t.integer  "user_id"
    t.integer  "agitation_before"
    t.integer  "agitation_after"
    t.integer  "awareness_before"
    t.integer  "awareness_after"
    t.integer  "communicativeness_before"
    t.integer  "communicativeness_after"
    t.integer  "duration"
    t.string   "playlist_owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_listening_sessions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "screen_name"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "provider"
    t.string   "refresh_token"
    t.string   "expires_at"
  end

  add_foreign_key "listening_sessions", "users"
end
