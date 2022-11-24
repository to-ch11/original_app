class CreateShippingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_details do |t|
      t.references :shipping, null: false, foreign_key: true
      t.string :date_on
      t.integer :quantity

      t.timestamps
    end
  end
end
