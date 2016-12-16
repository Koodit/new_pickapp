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

ActiveRecord::Schema.define(version: 20161114110553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrated_rooms", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_administrated_rooms_on_room_id", using: :btree
    t.index ["user_id"], name: "index_administrated_rooms_on_user_id", using: :btree
  end

  create_table "applied_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "notification_id"
    t.index ["travel_id"], name: "index_applied_users_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_applied_users_on_user_id", using: :btree
  end

  create_table "approved_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_approved_users_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_approved_users_on_user_id", using: :btree
  end

  create_table "badge_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "badge_category_id"
  end

  create_table "car_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "plate"
    t.integer  "sits"
    t.boolean  "can_smoke"
    t.boolean  "animals_allowed"
    t.integer  "cc"
    t.text     "notes"
    t.string   "model"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "car_category_id"
    t.integer  "user_id"
  end

  create_table "citizen_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_count",          default: 0
    t.float    "completion_percentage"
    t.boolean  "completed",             default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_citizen_badges_on_user_id", using: :btree
  end

  create_table "driver_details", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "patente_file_name"
    t.string   "patente_content_type"
    t.integer  "patente_file_size"
    t.datetime "patente_updated_at"
    t.string   "assicurazione_file_name"
    t.string   "assicurazione_content_type"
    t.integer  "assicurazione_file_size"
    t.datetime "assicurazione_updated_at"
    t.string   "license_type"
    t.string   "license_number"
    t.date     "license_release_date"
    t.date     "license_expire_date"
    t.string   "license_release_city"
    t.string   "license_release_city_common"
    t.index ["user_id"], name: "index_driver_details_on_user_id", using: :btree
  end

  create_table "macro_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.boolean  "from_user"
    t.string   "icon"
    t.boolean  "favourite"
    t.string   "event"
    t.boolean  "clicked",     default: false
    t.integer  "importance"
    t.integer  "emitter_id"
    t.integer  "receiver_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "params"
    t.string   "link"
    t.boolean  "is_message",  default: false
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id", using: :btree
  end

  create_table "parents_controls", force: :cascade do |t|
    t.string   "parent_mail"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "passenger_travels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_passenger_travels_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_passenger_travels_on_user_id", using: :btree
  end

  create_table "preferred_rooms", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_preferred_rooms_on_room_id", using: :btree
    t.index ["user_id"], name: "index_preferred_rooms_on_user_id", using: :btree
  end

  create_table "private_chats", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "travel_id"
    t.integer  "driver_id"
    t.integer  "passenger_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "private_chat_id"
    t.integer  "author_id"
    t.boolean  "read",            default: false
  end

  create_table "private_room_settings", force: :cascade do |t|
    t.string   "referral_domain"
    t.boolean  "admin_permission"
    t.text     "why_restrict"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "room_id"
  end

  create_table "public_chat_partecipants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_public_chat_partecipants_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_public_chat_partecipants_on_user_id", using: :btree
  end

  create_table "public_messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "author_id"
    t.integer  "travel_id"
    t.boolean  "is_travel_owner", default: false
  end

  create_table "room_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "room_images", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["room_id"], name: "index_room_images_on_room_id", using: :btree
  end

  create_table "room_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "room_id"
    t.integer  "author_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.boolean  "admin_editable"
    t.string   "name"
    t.float    "rating"
    t.float    "total_rating"
    t.integer  "number_of_ratings"
    t.float    "price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_private"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "trip_advisor"
    t.string   "phone"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "address"
    t.float    "lat"
    t.float    "long"
    t.integer  "room_category_id"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.text     "description"
    t.boolean  "is_school",                     default: false
  end

  create_table "school_room_partecipants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_school_room_partecipants_on_room_id", using: :btree
    t.index ["user_id"], name: "index_school_room_partecipants_on_user_id", using: :btree
  end

  create_table "school_room_settings", force: :cascade do |t|
    t.string   "school_representative"
    t.text     "non_partecipant_message"
    t.string   "referral_link"
    t.integer  "room_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "share_link"
    t.string   "code"
    t.string   "email_domain"
    t.index ["code"], name: "index_school_room_settings_on_code", unique: true, using: :btree
    t.index ["room_id"], name: "index_school_room_settings_on_room_id", using: :btree
  end

  create_table "selected_macro_categories", force: :cascade do |t|
    t.integer  "room_category_id"
    t.integer  "macro_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["macro_category_id"], name: "index_selected_macro_categories_on_macro_category_id", using: :btree
    t.index ["room_category_id"], name: "index_selected_macro_categories_on_room_category_id", using: :btree
  end

  create_table "selected_room_categories", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "room_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["room_category_id"], name: "index_selected_room_categories_on_room_category_id", using: :btree
    t.index ["room_id"], name: "index_selected_room_categories_on_room_id", using: :btree
  end

  create_table "social_master_badge_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "social_master_badge_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "social_master_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "relations_count",       default: 0
    t.boolean  "completed",             default: false
    t.float    "completion_percentage", default: 0.0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_social_master_badges_on_user_id", using: :btree
  end

  create_table "travel_request_chat_partecipants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_request_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["travel_request_id"], name: "index_travel_request_chat_partecipants_on_travel_request_id", using: :btree
    t.index ["user_id"], name: "index_travel_request_chat_partecipants_on_user_id", using: :btree
  end

  create_table "travel_request_messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "author_id"
    t.integer  "integer"
    t.integer  "travel_request_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_request_owner",  default: false
  end

  create_table "travel_requests", force: :cascade do |t|
    t.integer  "passenger_id"
    t.integer  "room_id"
    t.string   "starting_address"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "is_one_way"
    t.datetime "one_way_datetime"
    t.datetime "back_datetime"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "towards_room",        default: true
    t.boolean  "can_repay",           default: false
    t.string   "destination_address"
    t.text     "note"
    t.boolean  "flexible_departure"
    t.boolean  "only_with_feedback"
    t.index ["passenger_id"], name: "index_travel_requests_on_passenger_id", using: :btree
    t.index ["room_id"], name: "index_travel_requests_on_room_id", using: :btree
  end

  create_table "travel_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.integer  "travel_id"
    t.boolean  "made_by_driver"
    t.integer  "target_id"
    t.boolean  "to_be_written",  default: false
    t.integer  "room_id"
  end

  create_table "travel_stops", force: :cascade do |t|
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_travel_stops_on_travel_id", using: :btree
  end

  create_table "travels", force: :cascade do |t|
    t.string   "starting_address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "car_id"
    t.integer  "driver_id"
    t.integer  "room_id"
    t.string   "completion_token"
    t.boolean  "completed",           default: false
    t.boolean  "waiting_for_confirm", default: false
    t.datetime "departure_datetime"
    t.boolean  "towards_room"
    t.float    "starting_lat"
    t.float    "starting_lng"
    t.string   "destination_address"
    t.float    "destination_lat"
    t.float    "destination_lng"
    t.boolean  "is_recursive"
    t.boolean  "flexible_departure",  default: false
    t.boolean  "only_with_feedback",  default: false
    t.boolean  "can_repay"
  end

  create_table "user_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
    t.index ["user_id"], name: "index_user_badges_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.date     "birth_date"
    t.string   "name"
    t.string   "surname"
    t.string   "genre"
    t.string   "address"
    t.string   "comune"
    t.string   "prov"
    t.boolean  "is_driver"
    t.boolean  "is_verified"
    t.text     "description"
    t.string   "provider",                                 null: false
    t.string   "uid",                         default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "pending_driver_verification"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.integer  "car_count",                   default: 0
    t.text     "device_tokens"
    t.string   "zip_code"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
