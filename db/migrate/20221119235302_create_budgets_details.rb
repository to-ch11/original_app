class CreateBudgetsDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets_details do |t|
      t.references :budget, null: false, foreign_key: true
      t.string :date_on
      t.integer :quantity

      t.timestamps
    end
  end
end
