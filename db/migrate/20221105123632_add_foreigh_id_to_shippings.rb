class AddForeighIdToShippings < ActiveRecord::Migration[7.0]
  def change
    add_column :shippings, :item_id, :integer
    add_column :shippings, :budget_id, :integer
  end
end
