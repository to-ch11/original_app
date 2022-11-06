class CreateTotallings < ActiveRecord::Migration[7.0]
  def change
    create_table :totallings do |t|
      t.references :item_id, null: false, foreign_key: true
      t.date :year
      t.date :month
      t.integer :shipping_count

      t.timestamps
    end
  end
end
