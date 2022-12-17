class AddTotalCostToAccountHoldings < ActiveRecord::Migration[7.0]
  def change
    add_column :account_holdings, :total_cost, :float, precision: 2
  end
end
