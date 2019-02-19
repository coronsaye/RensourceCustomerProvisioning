class ChangeCustomerid < ActiveRecord::Migration[5.2]
  def change

    rename_column :customer_ids, :market_code, :market

  end
end
