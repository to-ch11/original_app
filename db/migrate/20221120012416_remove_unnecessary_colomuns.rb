class RemoveUnnecessaryColomuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :budgets, :date_on, :date
    remove_column :budgets, :quantity, :integer
    remove_column :shippings, :date_on, :date
    remove_column :shippings, :quantity, :integer
    rename_column :budgets_details, :date_on, :year_month
    rename_column :shipping_details, :date_on, :year_month
    drop_table :totallings
  end
end
