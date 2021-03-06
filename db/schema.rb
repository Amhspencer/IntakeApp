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

ActiveRecord::Schema.define(:version => 20150501231810) do

  create_table "forms", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "phone_number"
    t.string   "preferred_language"
    t.string   "cancer_care_provider"
    t.string   "service_area"
    t.boolean  "surgery"
    t.boolean  "chemo"
    t.boolean  "radiation"
    t.boolean  "late_stage"
    t.string   "income"
    t.boolean  "additional_info"
    t.boolean  "consent"
    t.string   "signature"
    t.datetime "date"
    t.integer  "user_id"
    t.string   "processed_by"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "medical_facility"
    t.boolean  "processed"
    t.string   "user_name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "organization"
    t.string   "password_digest"
    t.string   "type"
    t.boolean  "active"
  end

end
