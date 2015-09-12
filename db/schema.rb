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

ActiveRecord::Schema.define(version: 20150912013636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviewee_languages", force: :cascade do |t|
    t.boolean  "primary_language"
    t.integer  "language_id"
    t.integer  "interviewee_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "interviewee_languages", ["interviewee_id"], name: "index_interviewee_languages_on_interviewee_id", using: :btree
  add_index "interviewee_languages", ["language_id"], name: "index_interviewee_languages_on_language_id", using: :btree

  create_table "interviewees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviewers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.datetime "interview_time"
    t.integer  "study_id"
    t.integer  "interviewer_id"
    t.integer  "interviewee_id"
    t.integer  "locale_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "interviews", ["interviewee_id"], name: "index_interviews_on_interviewee_id", using: :btree
  add_index "interviews", ["interviewer_id"], name: "index_interviews_on_interviewer_id", using: :btree
  add_index "interviews", ["locale_id"], name: "index_interviews_on_locale_id", using: :btree
  add_index "interviews", ["study_id"], name: "index_interviews_on_study_id", using: :btree

  create_table "language_locales", force: :cascade do |t|
    t.boolean  "primary_language"
    t.integer  "language_id"
    t.integer  "locale_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "language_locales", ["language_id"], name: "index_language_locales_on_language_id", using: :btree
  add_index "language_locales", ["locale_id"], name: "index_language_locales_on_locale_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locales", ["region_id"], name: "index_locales_on_region_id", using: :btree

  create_table "recordings", force: :cascade do |t|
    t.binary   "audio"
    t.datetime "recorded"
    t.integer  "interview_id"
    t.integer  "language_id"
    t.integer  "word_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recordings", ["interview_id"], name: "index_recordings_on_interview_id", using: :btree
  add_index "recordings", ["language_id"], name: "index_recordings_on_language_id", using: :btree
  add_index "recordings", ["word_id"], name: "index_recordings_on_word_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "regions", ["country_id"], name: "index_regions_on_country_id", using: :btree

  create_table "studies", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "studies", ["region_id"], name: "index_studies_on_region_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "english_text"
    t.binary   "image"
    t.integer  "study_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "words", ["study_id"], name: "index_words_on_study_id", using: :btree

  add_foreign_key "interviewee_languages", "interviewees"
  add_foreign_key "interviewee_languages", "languages"
  add_foreign_key "interviews", "interviewees"
  add_foreign_key "interviews", "interviewers"
  add_foreign_key "interviews", "locales"
  add_foreign_key "interviews", "studies"
  add_foreign_key "language_locales", "languages"
  add_foreign_key "language_locales", "locales"
  add_foreign_key "locales", "regions"
  add_foreign_key "recordings", "interviews"
  add_foreign_key "recordings", "languages"
  add_foreign_key "recordings", "words"
  add_foreign_key "regions", "countries"
  add_foreign_key "studies", "regions"
  add_foreign_key "words", "studies"
end
