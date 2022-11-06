class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_on
      t.integer :quantity

      t.timestamps
    end
  end
end
