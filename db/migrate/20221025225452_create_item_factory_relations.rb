class CreateItemFactoryRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :item_factory_relations do |t|
      t.references :item, null: false, foreign_key: true
      t.references :factory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
