fast = Move.all.select { |m| m.category == 'fast' }
charged = Move.all.select { |m| m.category == 'charged' }

pairs = []

out = []

fast.each do |f|
	charged.each do |c|
		pairs << [f,c]
	end
end

pairs.each do |pair|
  f, c = pair

  uses = c.energy.to_f / f.energy.to_f

	damage = f.power.to_f * uses.to_f + c.power.to_f

	time = f.cooldown.to_f * uses.to_f + c.cooldown.to_f

	scaling = 100.0 / time.to_f

	damage_100 = damage * scaling

	out << [f.name, c.name, damage_100.to_f] if damage_100 > 0
end

out = out.sort_by { |x| x[2] }.reverse

puts out.inspect

# Move.all.each do |m|
#	next if m.category == 'charged'
#	puts m.name
#	puts "Power:    #{m.power}"
#	puts "Energy:   #{m.energy}"
#	puts "Cooldown: #{m.cooldown}"
#	puts "dps:      #{m.power / (m.cooldown / 1000.0)}"
#	puts "eps:      #{m.energy / (m.cooldown / 1000.0)}"
#	dpe = m.power.to_f / m.energy.to_f
#	puts "dpe:      #{dpe}"
#	puts "dpeps:    #{dpe / (m.cooldown / 1000.0)}"
# end
