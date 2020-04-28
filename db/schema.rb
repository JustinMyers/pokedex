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

ActiveRecord::Schema.define(version: 2020_03_18_212647) do

  create_table "matchups", force: :cascade do |t|
    t.integer "attacking_pokemon_type_id"
    t.integer "defending_pokemon_type_id"
    t.string "effectiveness"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "pokemon_type_id"
    t.string "category"
    t.integer "power"
    t.integer "energy"
    t.integer "cooldown"
    t.integer "pvp_power"
    t.integer "pvp_energy"
    t.integer "pvp_turns"
    t.string "weather"
    t.integer "damage_window_min"
    t.integer "damage_window_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves_pokemon", id: false, force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "pokemon_id", null: false
  end

  create_table "pokemon", force: :cascade do |t|
    t.string "name"
    t.integer "attack"
    t.integer "defense"
    t.integer "stamina"
    t.integer "gen"
    t.boolean "legendary"
    t.boolean "caught"
    t.integer "pokedexNumber"
    t.integer "ancestor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_pokemon_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "pokemon_type_id", null: false
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

end
