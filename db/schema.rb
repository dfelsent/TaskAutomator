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

ActiveRecord::Schema.define(:version => 20141117193607) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
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

  create_table "doi_comparisons", :force => true do |t|
    t.text     "heather"
    t.text     "hwx"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "doilists", :force => true do |t|
    t.text     "mylist"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "myuserid"
    t.string   "mypass"
    t.integer  "mymonth"
    t.integer  "mydate"
    t.integer  "myyear"
  end

  create_table "editorials", :force => true do |t|
    t.string   "edauthor"
    t.text     "edlink"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "regular_id"
  end

  create_table "homerights", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "issuedate"
  end

  create_table "mycodes", :force => true do |t|
    t.text     "podtitle"
    t.string   "speaker"
    t.text     "wimpy"
    t.text     "podlink"
    t.time     "duration"
    t.decimal  "mbsize",      :precision => 10, :scale => 4
    t.date     "date"
    t.text     "artlink"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "artauthor"
    t.text     "description"
    t.integer  "bytesize"
    t.text     "keywords"
  end

  create_table "regulars", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "title"
    t.string   "author"
    t.text     "link"
    t.integer  "homeright_id"
  end

  create_table "subject_sets", :force => true do |t|
    t.text     "subject_codes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "vol_jops", :force => true do |t|
    t.integer  "volume"
    t.integer  "issue"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "myuserid"
    t.string   "mypass"
    t.text     "mylist"
  end

  create_table "vols", :force => true do |t|
    t.integer  "volume"
    t.integer  "issue"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "myuserid"
    t.string   "mypass"
    t.text     "mylist"
  end

end
