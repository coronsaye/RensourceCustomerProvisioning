class ChangeMarketnoToMarket < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :market_no, :market
  end
end
