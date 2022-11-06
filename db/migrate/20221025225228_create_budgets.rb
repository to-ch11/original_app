class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.date :date_on
      t.integer :quantity

      t.timestamps
    end
  end
end
