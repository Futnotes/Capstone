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

ActiveRecord::Schema.define(version: 20140103154517) do

  create_table "availabilities", force: true do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["match_id"], name: "index_availabilities_on_match_id"
  add_index "availabilities", ["user_id"], name: "index_availabilities_on_user_id"

  create_table "goals", force: true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["match_id"], name: "index_goals_on_match_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "matches", force: true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "kick_off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_one_score"
    t.integer  "team_two_score"
    t.integer  "home_team_score"
    t.integer  "away_team_score"
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id"
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id"

  create_table "team_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_roles", ["team_id"], name: "index_team_roles_on_team_id"
  add_index "team_roles", ["user_id"], name: "index_team_roles_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "team_name"
    t.string   "team_name_short"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
