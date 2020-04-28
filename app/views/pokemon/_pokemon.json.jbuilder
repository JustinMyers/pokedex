json.extract! pokemon, :id, :name, :attack, :defense, :stamina, :gen, :legendary, :caught, :pokedexNumber, :ancestor_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
