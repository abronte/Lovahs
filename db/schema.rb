# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091030213720) do

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.string   "favorable_type", :limit => 30
    t.integer  "favorable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letter_categories", :force => true do |t|
    t.string "label"
  end

  create_table "letter_tags", :force => true do |t|
    t.integer  "letter_id"
    t.integer  "user_id"
    t.string   "tag_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letter_tags", ["letter_id"], :name => "index_missive_tags_on_missive_id"
  add_index "letter_tags", ["user_id"], :name => "index_missive_tags_on_member_id"

  create_table "letters", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_tag_list"
    t.integer  "cached_total_favorites", :default => 0
    t.integer  "letter_category_id",     :default => 1
  end

  add_index "letters", ["cached_total_favorites"], :name => "index_letters_on_cached_total_favorites"
  add_index "letters", ["user_id"], :name => "index_letters_on_user_id"

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "letter_id"
    t.text     "response_contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["letter_id"], :name => "index_responses_on_missive_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "res_address1"
    t.string   "res_address2"
    t.string   "res_city"
    t.string   "res_state"
    t.string   "res_country"
    t.string   "res_post_code"
    t.string   "contact_address1"
    t.string   "contact_address2"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_country"
    t.string   "contact_post_code"
    t.string   "picture_url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_profiles", ["contact_city"], :name => "index_member_profiles_on_contact_city"
  add_index "user_profiles", ["contact_country"], :name => "index_member_profiles_on_contact_country"
  add_index "user_profiles", ["contact_post_code"], :name => "index_member_profiles_on_contact_post_code"
  add_index "user_profiles", ["contact_state"], :name => "index_member_profiles_on_contact_state"
  add_index "user_profiles", ["first_name"], :name => "index_member_profiles_on_first_name"
  add_index "user_profiles", ["last_name"], :name => "index_member_profiles_on_last_name"
  add_index "user_profiles", ["res_city"], :name => "index_member_profiles_on_res_city"
  add_index "user_profiles", ["res_country"], :name => "index_member_profiles_on_res_country"
  add_index "user_profiles", ["res_post_code"], :name => "index_member_profiles_on_res_post_code"
  add_index "user_profiles", ["res_state"], :name => "index_member_profiles_on_res_state"

  create_table "user_types", :force => true do |t|
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_types", ["type_name"], :name => "index_member_types_on_member_type_name"

  create_table "users", :force => true do |t|
    t.string   "login_username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",    :default => "",    :null => false
    t.string   "email",               :default => "",    :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "status"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.boolean  "verified",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
