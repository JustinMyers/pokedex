class Matchup < ApplicationRecord
	belongs_to :attacking_pokemon_type, class_name: "PokemonType", foreign_key: "attacking_pokemon_type_id"
	belongs_to :defending_pokemon_type, class_name: "PokemonType", foreign_key: "defending_pokemon_type_id"

  default_scope { order(order: :asc) }

	# https://pokemongohub.net/post/wiki/type-effectiveness/
	
	EFFECTIVENESS = {
		"Immune" => 0.39,
		"Not Very Effective" =>	0.625,
		"Effective" => 1,
		"Super Effective" => 1.6
	}
end
