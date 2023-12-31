# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_13_121942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_affairs", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_budget_affairs_on_author_id"
  end

  create_table "budget_types", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_budget_types_on_author_id"
  end

  create_table "type_affairs", force: :cascade do |t|
    t.bigint "budget_affair_id", null: false
    t.bigint "budget_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_affair_id"], name: "index_type_affairs_on_budget_affair_id"
    t.index ["budget_type_id"], name: "index_type_affairs_on_budget_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budget_affairs", "users", column: "author_id"
  add_foreign_key "budget_types", "users", column: "author_id"
  add_foreign_key "type_affairs", "budget_affairs"
  add_foreign_key "type_affairs", "budget_types"
end
