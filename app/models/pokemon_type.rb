class PokemonType < ApplicationRecord
	has_many :attacking_matchups, inverse_of: :attacking_pokemon_type, class_name: "Matchup", foreign_key: :attacking_pokemon_type_id
	has_many :defending_matchups, inverse_of: :defending_pokemon_type, class_name: "Matchup", foreign_key: :defending_pokemon_type_id

 default_scope { order(order: :asc) }


	has_and_belongs_to_many :pokemon
	has_many :moves
end
