class CreatePokemon < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.integer :stamina
      t.integer :gen
      t.boolean :legendary
      t.boolean :caught
      t.integer :pokedexNumber
      t.integer :ancestor_id

      t.timestamps
    end
  end
end
