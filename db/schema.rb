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

ActiveRecord::Schema.define(version: 20180128152608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text "tag"
    t.text "card_text"
    t.integer "user_id"
    t.integer "citation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "structured_argument?"
    t.integer "structured_argument_id"
  end

  create_table "citation_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "citation_id"
    t.boolean "positive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citations", force: :cascade do |t|
    t.string "url_link"
    t.integer "up_vote"
    t.integer "down_vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author_first"
    t.string "author_last"
    t.string "article_title"
    t.string "article_date"
  end

  create_table "debates", force: :cascade do |t|
    t.integer "aff_user_id"
    t.integer "neg_user_id"
    t.integer "affirmative_votes"
    t.integer "negative_votes"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "free_forms", force: :cascade do |t|
    t.text "ff_text"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "speech_id"
  end

  create_table "response_types", force: :cascade do |t|
    t.boolean "response?"
    t.integer "user_id"
    t.integer "speech_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speeches", force: :cascade do |t|
    t.boolean "affirmative?"
    t.integer "user_id"
    t.string "speech_title"
    t.integer "debate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structured_arguments", force: :cascade do |t|
    t.boolean "advantage?"
    t.string "argument_name"
    t.integer "user_id"
    t.integer "speech_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer "user_id"
    t.string "topic_title"
    t.integer "prior_aff_votes"
    t.integer "prior_neg_votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_verification"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.integer "wins"
    t.integer "losses"
    t.integer "debates"
    t.integer "votes"
    t.integer "cards_created"
  end

end
