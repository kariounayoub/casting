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

ActiveRecord::Schema.define(version: 2019_06_08_143211) do

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evenement_id"], name: "index_inscriptions_on_evenement_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "evenement_id"
    t.string "categorie"
    t.text "contenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evenement_id"], name: "index_questions_on_evenement_id"
  end

  create_table "reponses", force: :cascade do |t|
    t.bigint "inscription_id"
    t.bigint "question_id"
    t.text "contenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inscription_id"], name: "index_reponses_on_inscription_id"
    t.index ["question_id"], name: "index_reponses_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prenom"
    t.string "nom"
    t.string "adresse"
    t.string "ville"
    t.date "naissance"
    t.string "sexe"
    t.boolean "admin"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inscriptions", "evenements"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "questions", "evenements"
  add_foreign_key "reponses", "inscriptions"
  add_foreign_key "reponses", "questions"
end
