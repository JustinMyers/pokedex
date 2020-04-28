class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :pokemon_type_id
      t.string :category
      t.integer :power
      t.integer :energy
      t.integer :cooldown
      t.integer :pvp_power
      t.integer :pvp_energy
      t.integer :pvp_turns
      t.string :weather
      t.integer :damage_window_min
      t.integer :damage_window_max

      t.timestamps
    end
  end
end
