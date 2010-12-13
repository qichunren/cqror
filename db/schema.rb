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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101213055836) do

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blacklists", :force => true do |t|
    t.string   "ip"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "email"
    t.string   "author"
    t.string   "website"
    t.text     "content"
    t.string   "user_ip"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.integer  "click_count"
    t.text     "content"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :limit => 200,                :null => false
    t.string   "email",               :limit => 200
    t.string   "crypted_password",    :limit => 200,                :null => false
    t.string   "password_salt",       :limit => 200,                :null => false
    t.string   "persistence_token",   :limit => 200,                :null => false
    t.string   "single_access_token", :limit => 200,                :null => false
    t.integer  "role",                :limit => 2,                  :null => false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.datetime "last_change_at"
    t.integer  "login_count",                        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["last_login_at"], :name => "index_users_on_last_login_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
