
ActiveRecord::Schema.define(version: 2021_01_20_131710) do

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "percentage_raised"
    t.float "target_amount"
    t.string "sector"
    t.string "country"
    t.float "investment_multiple"
    t.boolean "open"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "investments", force: :cascade do |t|
    t.string "user_name"
    t.float "investment_amount"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
