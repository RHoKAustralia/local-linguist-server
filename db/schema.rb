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

ActiveRecord::Schema.define(version: 20151204220538) do

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
    t.string   "mobile"
    t.string   "email"
    t.string   "gender"
    t.string   "occupation"
    t.string   "education_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "interviewers", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "device_id"
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

  create_table "locale_studies", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "locale_id"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locale_studies", ["locale_id"], name: "index_locale_studies_on_locale_id", using: :btree
  add_index "locale_studies", ["study_id"], name: "index_locale_studies_on_study_id", using: :btree

  create_table "locales", force: :cascade do |t|
    t.string   "name"
    t.integer  "municipality_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "locales", ["municipality_id"], name: "index_locales_on_municipality_id", using: :btree

  create_table "municipalities", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "municipalities", ["region_id"], name: "index_municipalities_on_region_id", using: :btree

  create_table "phrase_studies", force: :cascade do |t|
    t.integer  "phrase_id"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phrase_studies", ["phrase_id"], name: "index_phrase_studies_on_phrase_id", using: :btree
  add_index "phrase_studies", ["study_id"], name: "index_phrase_studies_on_study_id", using: :btree

  create_table "phrases", force: :cascade do |t|
    t.string   "english_text"
    t.binary   "audio"
    t.binary   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "recordings", force: :cascade do |t|
    t.binary   "audio"
    t.datetime "recorded"
    t.integer  "interview_id"
    t.integer  "language_id"
    t.integer  "phrase_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  add_index "recordings", ["interview_id"], name: "index_recordings_on_interview_id", using: :btree
  add_index "recordings", ["language_id"], name: "index_recordings_on_language_id", using: :btree
  add_index "recordings", ["phrase_id"], name: "index_recordings_on_phrase_id", using: :btree

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
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "studies", ["language_id"], name: "index_studies_on_language_id", using: :btree

  add_foreign_key "interviewee_languages", "interviewees"
  add_foreign_key "interviewee_languages", "languages"
  add_foreign_key "interviews", "interviewees"
  add_foreign_key "interviews", "interviewers"
  add_foreign_key "interviews", "locales"
  add_foreign_key "interviews", "studies"
  add_foreign_key "language_locales", "languages"
  add_foreign_key "language_locales", "locales"
  add_foreign_key "locale_studies", "locales"
  add_foreign_key "locale_studies", "studies"
  add_foreign_key "locales", "municipalities"
  add_foreign_key "municipalities", "regions"
  add_foreign_key "phrase_studies", "phrases"
  add_foreign_key "phrase_studies", "studies"
  add_foreign_key "recordings", "interviews"
  add_foreign_key "recordings", "languages"
  add_foreign_key "recordings", "phrases"
  add_foreign_key "regions", "countries"
  add_foreign_key "studies", "languages"
end
