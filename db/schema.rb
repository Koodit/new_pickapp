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
    t.integer  "notification_id"
    t.integer  "user_id"
    t.integer  "travel_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.integer  "value",             default: 0
    t.integer  "badge_category_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["badge_category_id"], name: "index_badges_on_badge_category_id", using: :btree
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
    t.integer  "car_category_id_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["car_category_id_id"], name: "index_cars_on_car_category_id_id", using: :btree
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "citizen_badges", force: :cascade do |t|
    t.float    "completion_percentage", default: 0.0
    t.boolean  "completed"
    t.integer  "travel_count",          default: 0
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_citizen_badges_on_user_id", using: :btree
  end

  create_table "driver_details", force: :cascade do |t|
    t.string   "license_release_city_common"
    t.string   "license_release_city"
    t.date     "license_expire_date"
    t.date     "license_relase_date"
    t.string   "license_number"
    t.string   "license_type"
    t.string   "assicurazione_file_name"
    t.string   "assicurazione_content_type"
    t.integer  "assicurazione_file_size"
    t.datetime "assicurazione_updated_at"
    t.string   "patente_file_name"
    t.string   "patente_content_type"
    t.integer  "patente_file_size"
    t.datetime "patente_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
    t.boolean  "from_user",   default: false
    t.string   "icon"
    t.boolean  "favorite",    default: false
    t.string   "event"
    t.boolean  "clicked",     default: false
    t.integer  "importance",  default: 0
    t.integer  "emitter_id"
    t.integer  "receiver_id"
    t.text     "params"
    t.string   "link"
    t.boolean  "is_message",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id", using: :btree
  end

  create_table "parent_controls", force: :cascade do |t|
    t.string   "parent_mail"
    t.string   "code"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_parent_controls_on_user_id", using: :btree
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
    t.integer  "driver_id"
    t.integer  "passenger_id"
    t.integer  "travel_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["driver_id"], name: "index_private_chats_on_driver_id", using: :btree
    t.index ["passenger_id"], name: "index_private_chats_on_passenger_id", using: :btree
    t.index ["travel_id"], name: "index_private_chats_on_travel_id", using: :btree
  end

  create_table "private_messages", force: :cascade do |t|
    t.text     "content"
    t.boolean  "read",            default: false
    t.integer  "author_id"
    t.integer  "private_chat_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["author_id"], name: "index_private_messages_on_author_id", using: :btree
    t.index ["private_chat_id"], name: "index_private_messages_on_private_chat_id", using: :btree
  end

  create_table "private_room_settings", force: :cascade do |t|
    t.string   "referral_domain"
    t.boolean  "admin_permission", default: false
    t.text     "why_restrict"
    t.integer  "room_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["room_id"], name: "index_private_room_settings_on_room_id", using: :btree
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
    t.boolean  "is_travel_owner"
    t.integer  "author_id"
    t.integer  "travel_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["author_id"], name: "index_public_messages_on_author_id", using: :btree
    t.index ["travel_id"], name: "index_public_messages_on_travel_id", using: :btree
  end

  create_table "room_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "room_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["room_id"], name: "index_room_images_on_room_id", using: :btree
  end

  create_table "room_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating",     default: 0
    t.integer  "author_id"
    t.integer  "room_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["author_id"], name: "index_room_reviews_on_author_id", using: :btree
    t.index ["room_id"], name: "index_room_reviews_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.boolean  "admin_editable",                default: false
    t.string   "name"
    t.float    "rating",                        default: 0.0
    t.float    "total_rating",                  default: 0.0
    t.integer  "number_of_ratings",             default: 0
    t.float    "price",                         default: 0.0
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_private",                    default: false
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "trip_advisor"
    t.string   "phone"
    t.string   "address"
    t.float    "lat"
    t.float    "long"
    t.text     "description"
    t.boolean  "is_school",                     default: false
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.integer  "room_category_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["room_category_id"], name: "index_rooms_on_room_category_id", using: :btree
  end

  create_table "school_room_partecipants", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_school_room_partecipants_on_room_id", using: :btree
    t.index ["user_id"], name: "index_school_room_partecipants_on_user_id", using: :btree
  end

  create_table "school_room_settings", force: :cascade do |t|
    t.string   "school_representative"
    t.text     "non_partecipant_message"
    t.string   "referral_link"
    t.string   "share_link"
    t.string   "code"
    t.string   "email_domain"
    t.integer  "room_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
    t.index ["social_master_badge_id"], name: "index_social_master_badge_relations_on_social_master_badge_id", using: :btree
    t.index ["user_id"], name: "index_social_master_badge_relations_on_user_id", using: :btree
  end

  create_table "social_master_badges", force: :cascade do |t|
    t.integer  "relations_count",       default: 0
    t.float    "completion_percentage", default: 0.0
    t.boolean  "completed",             default: false
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_social_master_badges_on_user_id", using: :btree
  end

  create_table "travel_request_chat_partecipants", force: :cascade do |t|
    t.integer  "travel_request_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["travel_request_id"], name: "index_travel_request_chat_partecipants_on_travel_request_id", using: :btree
    t.index ["user_id"], name: "index_travel_request_chat_partecipants_on_user_id", using: :btree
  end

  create_table "travel_request_messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "integer",           default: 0
    t.boolean  "is_request_owner",  default: false
    t.integer  "author_id"
    t.integer  "travel_request_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["author_id"], name: "index_travel_request_messages_on_author_id", using: :btree
    t.index ["travel_request_id"], name: "index_travel_request_messages_on_travel_request_id", using: :btree
  end

  create_table "travel_requests", force: :cascade do |t|
    t.string   "starting_address"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "is_one_way",          default: false
    t.datetime "one_way_datetime"
    t.datetime "back_datetime"
    t.boolean  "towards_room",        default: false
    t.boolean  "can_repay",           default: false
    t.string   "destination_address"
    t.text     "note"
    t.boolean  "flexible_departure",  default: false
    t.boolean  "only_with_feedback",  default: false
    t.integer  "passenger_id"
    t.integer  "room_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["passenger_id"], name: "index_travel_requests_on_passenger_id", using: :btree
    t.index ["room_id"], name: "index_travel_requests_on_room_id", using: :btree
  end

  create_table "travel_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating",         default: 0
    t.boolean  "made_by_driver", default: false
    t.boolean  "to_be_written",  default: false
    t.integer  "target_id"
    t.integer  "room_id"
    t.integer  "travel_id"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["room_id"], name: "index_travel_reviews_on_room_id", using: :btree
    t.index ["target_id"], name: "index_travel_reviews_on_target_id", using: :btree
    t.index ["travel_id"], name: "index_travel_reviews_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_travel_reviews_on_user_id", using: :btree
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
    t.string   "completion_token"
    t.boolean  "completed",           default: false
    t.boolean  "waiting_for_confirm", default: false
    t.datetime "departure_datetime"
    t.boolean  "towards_room",        default: false
    t.float    "starting_lat"
    t.float    "starting_lng"
    t.string   "destination_address"
    t.float    "destination_lat"
    t.float    "destination_lng"
    t.boolean  "is_recursive"
    t.boolean  "flexible_departure"
    t.boolean  "only_with_feedback"
    t.boolean  "can_repay"
    t.integer  "driver_id"
    t.integer  "room_id"
    t.integer  "car_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["car_id"], name: "index_travels_on_car_id", using: :btree
    t.index ["driver_id"], name: "index_travels_on_driver_id", using: :btree
    t.index ["room_id"], name: "index_travels_on_room_id", using: :btree
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
    t.string   "name"
    t.string   "surname"
    t.string   "nickname"
    t.date     "birth_date"
    t.string   "address"
    t.string   "prov"
    t.integer  "comune"
    t.string   "zip_code"
    t.text     "description"
    t.string   "genre"
    t.string   "role"
    t.integer  "car_count",                   default: 0
    t.boolean  "is_driver",                   default: false
    t.boolean  "is_verified",                 default: false
    t.boolean  "pending_driver_verification", default: false
    t.string   "image"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.text     "device_tokens"
    t.string   "provider"
    t.string   "uid"
    t.json     "tokens"
    t.string   "email",                       default: "",    null: false
    t.string   "encrypted_password",          default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
