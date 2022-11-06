class AddBranchIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :branch_id, :integer
  end
end
