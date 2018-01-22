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

ActiveRecord::Schema.define(version: 20171218145133) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "resident_id"
    t.bigint "community_id"
    t.string "form"
    t.string "description"
    t.string "status"
    t.index ["community_id"], name: "index_articles_on_community_id"
    t.index ["resident_id"], name: "index_articles_on_resident_id"
  end

  create_table "communities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "login_pwd"
    t.string "street"
    t.string "number"
    t.string "residents"
  end

  create_table "residents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "community_id"
    t.string "name"
    t.string "articles"
    t.index ["community_id"], name: "index_residents_on_community_id"
  end

end
