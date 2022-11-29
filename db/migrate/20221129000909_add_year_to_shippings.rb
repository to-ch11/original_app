class AddYearToShippings < ActiveRecord::Migration[7.0]
  def change
    add_column :shippings, :year, :string
    add_column :budgets, :year, :string
    rename_column :shipping_details, :year_month, :month
    rename_column :budgets_details, :year_month, :month
  end
end
