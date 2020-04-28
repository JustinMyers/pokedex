class CreateJoinTableMovesPokemon < ActiveRecord::Migration[6.0]
  def change
    create_join_table :moves, :pokemon do |t|
      # t.index [:move_id, :pokemon_id]
      # t.index [:pokemon_id, :move_id]
    end
  end
end
