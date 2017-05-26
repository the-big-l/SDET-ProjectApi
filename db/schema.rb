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

ActiveRecord::Schema.define(version: 20170526044040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "project_name"
    t.datetime "creation_date"
    t.datetime "expiry_date"
    t.boolean  "enabled"
    t.float    "project_cost"
    t.string   "project_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_cost"], name: "index_projects_on_project_cost", unique: true, using: :btree
    t.index ["project_id"], name: "index_projects_on_project_id", unique: true, using: :btree
    t.index ["project_name"], name: "index_projects_on_project_name", unique: true, using: :btree
  end

end
