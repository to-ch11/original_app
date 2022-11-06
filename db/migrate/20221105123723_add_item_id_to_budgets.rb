class AddItemIdToBudgets < ActiveRecord::Migration[7.0]
  def change
    add_column :budgets, :item_id, :integer
  end
end
