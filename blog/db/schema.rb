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

ActiveRecord::Schema.define(:version => 201011030759542) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "author_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "article_id"
    t.string   "author_name"
    t.string   "site_url"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_authorizations", :force => true do |t|
    t.string   "user_id"
    t.integer  "oauth_client_id"
    t.string   "code"
    t.integer  "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_clients", :force => true do |t|
    t.string   "name"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "redirect_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_tokens", :force => true do |t|
    t.string   "user_id"
    t.integer  "oauth_client_id"
    t.string   "access_token"
    t.string   "refresh_token"
    t.integer  "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
