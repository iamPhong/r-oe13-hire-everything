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

ActiveRecord::Schema.define(version: 2019_03_01_015144) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "news_need_rent_id"
    t.bigint "news_lease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_lease_id"], name: "index_comments_on_news_lease_id"
    t.index ["news_need_rent_id"], name: "index_comments_on_news_need_rent_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "main_photo"
    t.string "sub_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_leases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.bigint "place_id"
    t.bigint "image_id"
    t.integer "price_type", default: 0, null: false
    t.integer "price_value"
    t.integer "deposit_price"
    t.string "deposit_paper"
    t.string "product_name"
    t.text "description"
    t.integer "sell"
    t.string "key_search"
    t.string "lease_name"
    t.string "lease_phone_number"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_news_leases_on_category_id"
    t.index ["image_id"], name: "index_news_leases_on_image_id"
    t.index ["place_id"], name: "index_news_leases_on_place_id"
    t.index ["user_id"], name: "index_news_leases_on_user_id"
  end

  create_table "news_need_rents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "product_name"
    t.text "description"
    t.string "picture"
    t.string "address"
    t.string "phone_number"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_news_need_rents_on_category_id"
    t.index ["user_id"], name: "index_news_need_rents_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "birthday"
    t.string "address"
    t.string "phone_number"
    t.string "facebook"
    t.string "website"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "news_leases"
  add_foreign_key "comments", "news_need_rents"
  add_foreign_key "comments", "users"
  add_foreign_key "news_leases", "categories"
  add_foreign_key "news_leases", "images"
  add_foreign_key "news_leases", "places"
  add_foreign_key "news_leases", "users"
  add_foreign_key "news_need_rents", "categories"
  add_foreign_key "news_need_rents", "users"
end
