puts Pokemon.all.map { |p| [p.name, p.best_moveset[2],p.best_moveset[0],p.best_moveset[1]]}.sort_by {|p| p[1]}.last(100)
