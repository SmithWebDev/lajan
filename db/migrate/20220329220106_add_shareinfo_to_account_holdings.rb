class AddShareinfoToAccountHoldings < ActiveRecord::Migration[7.0]
  def change
    add_column :account_holdings, :shares, :float
    add_column :account_holdings, :cost_per_share, :float
  end
end
