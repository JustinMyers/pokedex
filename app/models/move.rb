class Move < ApplicationRecord
	has_and_belongs_to_many :pokemon
	belongs_to :pokemon_type

	attr_accessor :stab

	def	dps
		power / ( cooldown / 1000.0 ).to_f * ( stab ? 1.25 : 1 )
	end

	def	eps
		energy / ( cooldown / 1000.0).to_f
  end
end
