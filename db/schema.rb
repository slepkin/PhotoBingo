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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130812215024) do

  create_table "boards", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "boards", ["game_id", "user_id"], :name => "index_boards_on_game_id_and_user_id"

  create_table "cells", :force => true do |t|
    t.integer  "board_id"
    t.integer  "phrase_id"
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cells", ["board_id", "phrase_id"], :name => "index_cells_on_board_id_and_phrase_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "games", :force => true do |t|
    t.integer  "theme_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "end",        :default => false
  end

  add_index "games", ["theme_id"], :name => "index_games_on_theme_id"

  create_table "notifications", :force => true do |t|
    t.integer  "game_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "quality"
    t.integer  "photo_id"
  end

  add_index "notifications", ["subject_id", "game_id", "photo_id"], :name => "index_notifications_on_subject_id_and_game_id_and_photo_id"

  create_table "photos", :force => true do |t|
    t.integer  "cell_id"
    t.string   "img"
    t.string   "status",           :default => "pending"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "photos", ["cell_id"], :name => "index_photos_on_cell_id"

  create_table "phrases", :force => true do |t|
    t.string   "body"
    t.integer  "theme_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phrases", ["theme_id"], :name => "index_phrases_on_theme_id"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "themes", ["user_id"], :name => "index_themes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "count",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "visits", ["user_id", "game_id"], :name => "index_visits_on_user_id_and_game_id"

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.boolean  "approve"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["user_id", "photo_id"], :name => "index_votes_on_user_id_and_photo_id"

end
