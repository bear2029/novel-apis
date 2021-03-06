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

ActiveRecord::Schema.define(version: 20160310071104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authors", ["name"], name: "index_authors_on_name", unique: true, using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "crawler_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["name"], name: "index_books_on_name", unique: true, using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "title"
    t.string   "body"
    t.integer  "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree
  add_index "chapters", ["seq"], name: "index_chapters_on_seq", using: :btree

  create_table "crawlers", force: :cascade do |t|
    t.string   "name"
    t.string   "test_list_url"
    t.string   "test_item_url"
    t.string   "list_url_pattern"
    t.string   "item_url_pattern"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "crawlers"
  add_foreign_key "chapters", "books"
end
