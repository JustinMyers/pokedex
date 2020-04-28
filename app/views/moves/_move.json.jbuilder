json.extract! move, :id, :name, :pokemon_type_id, :category, :power, :energy, :cooldown, :pvp_power, :pvp_energy, :pvp_turns, :weather, :damage_window_min, :damage_window_max, :created_at, :updated_at
json.url move_url(move, format: :json)
