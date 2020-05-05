# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_05_195637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.string "content"
    t.index ["pet_id"], name: "index_comments_on_pet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "age"
    t.string "description"
    t.string "location"
    t.string "imageUrl"
    t.date "postedDate"
    t.boolean "isAdopted"
    t.string "size"
    t.boolean "spayed_neutered"
    t.boolean "house_trained"
    t.string "gender"
    t.string "colors"
    t.string "species"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "location"
  end

  add_foreign_key "comments", "pets"
  add_foreign_key "comments", "users"
end
