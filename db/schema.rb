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

ActiveRecord::Schema.define(:version => 20101021005229) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "officialurl"
    t.string   "imageurl"
    t.string   "amazonurl"
    t.integer  "rating"
    t.string   "console"
    t.string   "publisher"
    t.string   "developer"
    t.date     "releasedate"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "officialurl"
    t.string   "imageurl"
    t.string   "amazonurl"
    t.integer  "rating"
    t.string   "studio"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "modelnumber"
    t.string   "officialurl"
    t.string   "imageurl"
    t.string   "amazonurl"
    t.integer  "rating"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.string   "author"
    t.text     "review"
    t.string   "sitename"
    t.string   "siteurl"
    t.string   "imageurl"
    t.integer  "rating"
    t.string   "quotable_type"
    t.integer  "quotable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
