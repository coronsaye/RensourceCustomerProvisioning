class CreateAccountIds < ActiveRecord::Migration[5.2]
  def change
    create_table :account_ids do |t|
      t.string :ref_no
      t.string :market_no
      t.boolean :status
      t.integer :serial_no
      t.timestamps
    end
  end
end
