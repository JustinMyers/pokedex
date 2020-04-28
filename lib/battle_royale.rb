@output = {}

def init_output(pokemon)
	@output[pokemon.name] ||= {
		'attacking wins' => 0,
		'defending wins' =>  0,
		'total attacking time' => 0,
		'total defending lifespan' => 0,
		'results' => {
			'attacking' => { 'won' => [], 'lost' => [] },
			'defending' => { 'won' => [], 'lost' => [] }
		}
	}
end

attackers = Pokemon.where(name: "Charizard")
defenders = Pokemon.where(name: "Aggron")

attackers.each do |attacker|
	defenders.all.each do |defender|
		# puts "#{attacker.name} vs. #{defender.name}... FIGHT!"
		init_output(attacker)
		init_output(defender)

		attacker_win_seconds = attacker.damage_output_vs(defender)
		defender_win_seconds = defender.damage_output_vs(attacker, false)

		if attacker_win_seconds[:win_in_n_seconds] < defender_win_seconds[:win_in_n_seconds]
			# puts "The attacking #{attacker.name} wins!"
			@output[attacker.name]['attacking wins'] += 1
			@output[attacker.name]['results']['attacking']['won'] << defender.name
			@output[defender.name]['results']['defending']['lost'] << attacker.name
		else
			# puts "The defending #{defender.name} wins!"
			@output[defender.name]['defending wins'] += 1
			@output[defender.name]['results']['defending']['won'] << attacker.name
			@output[attacker.name]['results']['attacking']['lost'] << defender.name
		end

    @output[attacker.name]['total attacking time'] += attacker_win_seconds[:win_in_n_seconds]
		@output[defender.name]['total defending lifespan'] += defender_win_seconds[:win_in_n_seconds]
	end
end

puts @output.inspect
