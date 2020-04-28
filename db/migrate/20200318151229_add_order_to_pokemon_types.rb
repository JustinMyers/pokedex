class AddOrderToPokemonTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_types, :order, :integer
  end
end
