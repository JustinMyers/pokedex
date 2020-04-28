class AddOrderToMatchups < ActiveRecord::Migration[6.0]
  def change
    add_column :matchups, :order, :integer
  end
end
