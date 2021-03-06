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

ActiveRecord::Schema.define(version: 20170404081857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviewees", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.string "gender"
    t.string "occupation"
    t.string "education_level"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "locale_id"
    t.boolean "lived_whole_life"
    t.string "first_language"
  end

  create_table "interviewers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "device_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", id: :serial, force: :cascade do |t|
    t.datetime "interview_time"
    t.integer "study_id"
    t.integer "interviewer_id"
    t.integer "interviewee_id"
    t.integer "locale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zipfile_file_name"
    t.string "zipfile_content_type"
    t.integer "zipfile_file_size"
    t.datetime "zipfile_updated_at"
    t.integer "language_id"
    t.index ["interviewee_id"], name: "index_interviews_on_interviewee_id"
    t.index ["interviewer_id"], name: "index_interviews_on_interviewer_id"
    t.index ["locale_id"], name: "index_interviews_on_locale_id"
    t.index ["study_id"], name: "index_interviews_on_study_id"
  end

  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_code"
  end

  create_table "locale_studies", id: :serial, force: :cascade do |t|
    t.boolean "completed"
    t.integer "locale_id"
    t.integer "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale_id"], name: "index_locale_studies_on_locale_id"
    t.index ["study_id"], name: "index_locale_studies_on_study_id"
  end

  create_table "locales", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_locales_on_municipality_id"
  end

  create_table "municipalities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_municipalities_on_region_id"
  end

  create_table "phrases", id: :serial, force: :cascade do |t|
    t.string "english_text"
    t.text "choices", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audio_file_name"
    t.string "audio_content_type"
    t.integer "audio_file_size"
    t.datetime "audio_updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "response_type_id"
    t.integer "study_id"
    t.string "prompt_text"
  end

  create_table "recordings", id: :serial, force: :cascade do |t|
    t.datetime "recorded"
    t.integer "interview_id"
    t.integer "phrase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audio_file_name"
    t.string "audio_content_type"
    t.integer "audio_file_size"
    t.datetime "audio_updated_at"
    t.string "text_response"
    t.index ["interview_id"], name: "index_recordings_on_interview_id"
    t.index ["phrase_id"], name: "index_recordings_on_phrase_id"
  end

  create_table "regions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "studies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interviews", "interviewees"
  add_foreign_key "interviews", "interviewers"
  add_foreign_key "interviews", "locales"
  add_foreign_key "interviews", "studies"
  add_foreign_key "locale_studies", "locales"
  add_foreign_key "locale_studies", "studies"
  add_foreign_key "locales", "municipalities"
  add_foreign_key "municipalities", "regions"
  add_foreign_key "recordings", "interviews"
  add_foreign_key "recordings", "phrases"
  add_foreign_key "regions", "countries"
end
