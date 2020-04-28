class CreateMatchups < ActiveRecord::Migration[6.0]
  def change
    create_table :matchups do |t|
      t.integer :attacking_pokemon_type_id
      t.integer :defending_pokemon_type_id
      t.string :effectiveness

      t.timestamps
    end
  end
end
