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

ActiveRecord::Schema.define(version: 20170611110812) do

  create_table "bets", force: :cascade do |t|
    t.string   "name"
    t.integer  "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_bets_on_contest_id"
    t.index ["name"], name: "index_bets_on_name", unique: true
  end

  create_table "contestants", force: :cascade do |t|
    t.integer  "start_nbr"
    t.integer  "position"
    t.string   "country"
    t.string   "title"
    t.integer  "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_contestants_on_contest_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string   "name"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "placements", force: :cascade do |t|
    t.integer  "position"
    t.integer  "bet_id"
    t.integer  "contestant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["bet_id", "contestant_id"], name: "index_placements_on_bet_id_and_contestant_id", unique: true
    t.index ["bet_id"], name: "index_placements_on_bet_id"
    t.index ["contestant_id"], name: "index_placements_on_contestant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
