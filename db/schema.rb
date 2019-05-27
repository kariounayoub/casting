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

ActiveRecord::Schema.define(version: 2019_05_27_115318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evenements", force: :cascade do |t|
    t.string "nom"
    t.date "date"
    t.string "adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "actif"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "evenement_id"
    t.text "q1"
    t.text "r1"
    t.text "q2"
    t.text "r2"
    t.text "q3"
    t.text "r3"
    t.text "q4"
    t.text "r4"
    t.text "q5"
    t.text "r5"
    t.text "q6"
    t.text "r6"
    t.text "q7"
    t.text "r7"
    t.text "q8"
    t.text "r8"
    t.text "q9"
    t.text "r9"
    t.text "q10"
    t.text "r10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evenement_id"], name: "index_inscriptions_on_evenement_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "evenement_id"
    t.text "contenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evenement_id"], name: "index_questions_on_evenement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inscriptions", "evenements"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "questions", "evenements"
end
