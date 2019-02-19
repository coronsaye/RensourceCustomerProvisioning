class RenameAccountIdToAccount < ActiveRecord::Migration[5.2]
  def change
    rename_table :account_ids, :accounts
  end
end
