# curl https://db.pokemongohub.net/moves/214
# curl https://db.pokemongohub.net/api/moves/214
# curl https://db.pokemongohub.net/api/moves
# curl https://db.pokemongohub.net/api/moves/with-filter/fast/with-stats
# curl https://db.pokemongohub.net/api/moves/with-filter/fast/with-stats > moves-fast.json
# curl https://db.pokemongohub.net/api/moves/with-filter/charge/with-stats > moves-charge.json
# curl https://db.pokemongohub.net/api/pokemon
# curl https://db.pokemongohub.net/api/pokemon/with-generation/0
# curl https://db.pokemongohub.net/api/pokemon/with-generation/2
# curl https://db.pokemongohub.net/api/pokemon/with-generation/1
# curl https://db.pokemongohub.net/api/pokemon/with-generation/1 > pokemon-1.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/2 > pokemon-2.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/3 > pokemon-3.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/3 > pokemon-4.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/4 > pokemon-4.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/5 > pokemon-5.json
# curl https://db.pokemongohub.net/api/pokemon/with-generation/6 > pokemon-6.json

# ["id", "name", "form", "type1", "type2", "atk", "sta", "def", "isMythical", "isLegendary", "generation", "candyToEvolve", "kmBuddyDistance", "baseCaptureRate", "description", "weight", "height", "buddySize", "baseFleeRate", "kmDistanceToHatch", "thirdMoveStardust", "thirdMoveCandy", "family", "is_deployable", "is_transferable", "bonus_stardust_capture_reward", "bonus_candy_capture_reward", "template_id", "male", "female", "genderless", "forms", "descriptions", "typeChart", "weatherInfluences", "CPs", "maxcp"]

# fast_moves = `curl https://db.pokemongohub.net/api/moves/with-filter/fast/with-stats`
# fast_moves = JSON.parse(fast_moves)

# charge_moves = `curl https://db.pokemongohub.net/api/moves/with-filter/charge/with-stats`
# charge_moves = JSON.parse(charge_moves)

# gen1 = JSON.parse(`curl https://db.pokemongohub.net/api/pokemon/with-generation/1`)

pokedex_number = 1

while ( pokemon = `curl -s https://db.pokemongohub.net/api/pokemon/#{pokedex_number}` ) != "null"
	pokemon = JSON.parse(pokemon)

	pokemon_attributes = [:name, :attack, :defense, :stamina, :gen, :legendary, :caught, :pokedexNumber, :ancestor_id]

	p = Pokemon.new

	p.name = pokemon["name"]
	p.attack = pokemon["atk"]
	p.defense = pokemon["def"]
	p.stamina = pokemon["sta"]
	p.gen = pokemon["generation"]
	p.legendary = pokemon["legendary"]
	p.pokedexNumber = pokedex_number
	p.pokemon_types << PokemonType.find_or_create_by(name: pokemon["type1"].capitalize) if pokemon["type1"]
	p.pokemon_types << PokemonType.find_or_create_by(name: pokemon["type2"].capitalize) if pokemon["type2"]

	p.save

	puts p.name

	moves = JSON.parse(`curl -s https://db.pokemongohub.net/api/moves/with-pokemon/#{pokedex_number}`)

	moves.each do |move|
		next if move["isLegacy"] == 1
		m = Move.find_or_create_by(name: move["name"])
		m.pokemon_type = PokemonType.find_or_create_by(name: move["type"].capitalize)
		m.category = ( move["isQuickMove"] == 1 ? "fast" : "charged" )
		m.power = move["power"]
		m.energy = move["energy"]
		m.cooldown = move["duration"]
		m.pvp_power = move["pvpPower"]
		m.pvp_energy = move["pvpEnergy"]
		m.pvp_turns = move["pvpDuration"]
		# m.weather
		m.damage_window_min = move["damageWindowStart"]
		m.damage_window_max = move["damageWindowEnd"]
		m.save

		puts "- #{m.name} (#{m.category})"

		p.moves << m
	end

	pokedex_number = pokedex_number + 1
	sleep(rand * 2)
end
