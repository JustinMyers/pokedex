class Pokemon < ApplicationRecord
	has_and_belongs_to_many :moves
	has_and_belongs_to_many :pokemon_types

	def	moves
		my_moves = super

		pokemon_type_ids = self.pokemon_types.pluck(:id)

		my_moves.each { |m| m.stab = ( self.pokemon_type_ids & [m.pokemon_type_id] ).present? }

		my_moves
	end

	def damage_output_vs(defending_pokemon = nil, attacking = true)
    	my_moves = moves

		my_best_moveset = best_moveset(attacking)

		fast_move = my_moves.detect { |m| m.name == my_best_moveset[0] } || Move.find_by_name("Splash")
		primary_charged_move = my_moves.detect { |m| m.name == my_best_moveset[1] } || Move.find_by_name("Struggle")
		secondary_charged_move = my_moves.detect { |m| m.name == my_best_moveset[3] }

		use_primary = true

		primary_scalar = 1
		secondary_scalar = 1

		if defending_pokemon
			primary_type = primary_charged_move.pokemon_type
			defending_types = defending_pokemon.pokemon_types
			matchups = Matchup.where("attacking_pokemon_type_id = ? AND defending_pokemon_type_id IN (?)",primary_type.id, defending_types.map(&:id))
			primary_scalar = matchups.map { |m| Matchup::EFFECTIVENESS[m.effectiveness] }.reduce(:*)
			primary_dps = my_best_moveset[2] * primary_scalar

			if secondary_charged_move
			secondary_type = secondary_charged_move.pokemon_type
			matchups = Matchup.where("attacking_pokemon_type_id = ? AND defending_pokemon_type_id IN (?)",secondary_type.id,defending_types.map(&:id))

			secondary_scalar = matchups.map { |m| Matchup::EFFECTIVENESS[m.effectiveness]}.reduce(:*)
			secondary_dps = my_best_moveset[4] * secondary_scalar
			
			use_primary = primary_dps > secondary_dps
			end

			# puts "The pokemon has a scalar of #{use_primary ? primary_scalar : secondary_scalar}!"
		end

		f = fast_move
		c = use_primary ? primary_charged_move : secondary_charged_move

	  uses = ( c.energy.to_f - (attacking ? 0 : f.energy.to_f ) ) / f.energy.to_f
	  damage = f.power.to_f * uses.to_f * ( f.stab ? 1.2 : 1 ) + c.power.to_f * (c.stab ? 1.2 : 1 )
		damage = damage * ( use_primary ? primary_scalar : secondary_scalar )
			
	  average_def = 142.0
		effective_def = defending_pokemon.try(:defense) || average_def

		damage = ((0.5 * damage * ( ( self.attack + 15 ) * Pokemon::CPM[40] ) / effective_def ) + 1)

		damage = ( damage.nan? || damage.nil? ) ? 0 : damage.floor

		if attacking
			time = f.cooldown.to_f * uses.to_f + c.cooldown.to_f
		else
			time = 2000.0 * uses.to_f + 2000.0
		end
		dps = damage.to_f / time.to_f * 1000.0

		if defending_pokemon
			enemy_health = (defending_pokemon.stamina + 15) * Pokemon::CPM[40]
		else
			enemy_health = 200
		end

		{
			win_in_n_seconds: enemy_health / dps.to_f
		}
	end
	
	def	movesets(attacking = true)
		my_moves = moves

		fast_moves = my_moves.select { |m| m.category == 'fast' }
		charged_moves = my_moves.select { |m| m.category == 'charged' }

		pairs = []

		out = []

		fast_moves.each do |f|
			charged_moves.each do |c|
				pairs << [f,c]
			end
		end

		pairs.each do |pair|
			f, c = pair
			uses = ( c.energy.to_f - (attacking ? 0 : f.energy.to_f ) ) / f.energy.to_f
			damage = f.power.to_f * uses.to_f * ( f.stab ? 1.2 : 1 ) + c.power.to_f * (c.stab ? 1.2 : 1 )
			
			average_def = 142.0

			damage = ((0.5 * damage * ( ( self.attack + 15 ) * Pokemon::CPM[40] ) / average_def ) + 1)

			damage = ( damage.nan? || damage.nil? ) ? 0 : damage.floor

			if attacking
			  time = f.cooldown.to_f * uses.to_f + c.cooldown.to_f
			else
				time = 2000.0 * uses.to_f + 2000.0
			end	
			dps = damage.to_f / time.to_f * 1000.0
			out << [f.name, c.name, dps, c.pokemon_type.name] if dps > 0
		end

		out = out.sort_by { |x| x[2] }.reverse

		out
	end

	def best_moveset(attacking = true)
    out = movesets(attacking)

		best_combo = out.first || ['Splash', 'Struggle', 0]

	  best_secondary_charged_move = out.detect { |x| x[0] == best_combo[0] and x[3] != best_combo[3] }

		if best_secondary_charged_move
      best_combo[3] = best_secondary_charged_move[1]
			best_combo[4] = best_secondary_charged_move[2]
    else
			best_combo[3] = nil
			best_combo.compact!
		end

		best_combo
	end

	def	max_cp(level = 40, attack_iv = 15, defense_iv = 15, hp_iv = 15)
		attack = self.attack + attack_iv
		defense = ( self.defense + defense_iv ) ** 0.5
		hp = ( self.stamina + hp_iv ) ** 0.5
		cpm = ( Pokemon::CPM[level] || 0.79030001 ) ** 2
		cp = [10,	(attack * defense * hp * cpm )  / 10 ].max.floor

		cp
	end

	# https://www.dragonflycave.com/pokemon-go/stats
	CPM = {
		37.5 => 0.776064962,
		38 =>  0.77893275,
		38.5 => 0.781790055,
		39 => 0.78463697,
		39.5 => 0.787473578,
		40 => 0.79030001
	}
end
