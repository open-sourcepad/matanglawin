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

ActiveRecord::Schema.define(version: 20160729074948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "contact"
    t.string   "lambdal_id"
    t.string   "nickname"
    t.date     "birthday"
    t.integer  "age"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "mytype"
  end

  create_table "social_identities", force: :cascade do |t|
    t.integer "user_id"
    t.string  "uid"
    t.string  "provider"
    t.text    "raw_object"
    t.index ["user_id"], name: "index_social_identities_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "is_active",          default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
