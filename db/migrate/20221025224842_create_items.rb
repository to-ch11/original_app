class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.integer :large_classification
      t.integer :small_classification
      t.integer :component_n
      t.integer :component_p
      t.integer :component_k

      t.timestamps
    end
  end
end
