class CreateJoinTablePokemonPokemonTypes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemon, :pokemon_types do |t|
      # t.index [:pokemon_id, :pokemon_type_id]
      # t.index [:pokemon_type_id, :pokemon_id]
    end
  end
end
