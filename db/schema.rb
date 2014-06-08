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

ActiveRecord::Schema.define(version: 20140607235707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "agency_ref"
    t.string   "agency"
    t.string   "program"
    t.string   "agency_type_id"
    t.string   "type"
    t.string   "hours"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "contact"
    t.string   "e_mail"
    t.string   "county"
    t.boolean  "open_sun_am"
    t.boolean  "open_sun_pm"
    t.boolean  "open_mon_am"
    t.boolean  "open_mon_pm"
    t.boolean  "open_tue_am"
    t.boolean  "open_tue_pm"
    t.boolean  "open_wed_am"
    t.boolean  "open_wed_pm"
    t.boolean  "open_thr_am"
    t.boolean  "open_thr_pm"
    t.boolean  "open_fri_am"
    t.boolean  "open_fri_pm"
    t.boolean  "open_sat_am"
    t.boolean  "open_sat_pm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
