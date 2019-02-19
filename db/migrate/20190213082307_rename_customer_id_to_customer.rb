class RenameCustomerIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    rename_table :customer_ids, :customers
  end
end
