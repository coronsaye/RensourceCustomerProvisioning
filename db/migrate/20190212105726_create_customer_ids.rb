class CreateCustomerIds < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_ids do |t|
      t.string :ref_no
      t.string :market_code
      t.boolean :status
      t.integer :serial_no
      t.timestamps
    end
  end
end
