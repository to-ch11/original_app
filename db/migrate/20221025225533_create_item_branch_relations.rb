class CreateItemBranchRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :item_branch_relations do |t|
      t.references :item, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
