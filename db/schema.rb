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

ActiveRecord::Schema[7.0].define(version: 2024_08_30_011942) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8", force: :cascade do |t|
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "addresses", null: false
    t.string "phone_number", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_addresses_on_reservation_id"
  end

  create_table "chats", charset: "utf8", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_chats_on_trainer_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "messages", charset: "utf8", force: :cascade do |t|
    t.text "content", null: false
    t.string "sender_type", null: false
    t.integer "sender_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "reservations", charset: "utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_reading", null: false
    t.string "first_name_reading", null: false
    t.date "date", null: false
    t.integer "time_id", null: false
    t.text "request", null: false
    t.bigint "trainer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_reservations_on_trainer_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "trainers", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_reading", null: false
    t.string "first_name_reading", null: false
    t.integer "age", null: false
    t.integer "gender_id", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.integer "registration_number", null: false
    t.text "career", null: false
    t.text "profile", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "service_radius_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_trainers_on_email", unique: true
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.integer "age", null: false
    t.integer "gender_id", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.text "profile", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "reservations"
  add_foreign_key "chats", "trainers"
  add_foreign_key "chats", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "reservations", "trainers"
  add_foreign_key "reservations", "users"
end
