class AddDividendAmountToPriceHistoryWeekly < ActiveRecord::Migration[7.0]
  def change
    add_column :price_history_weeklies, :dividend_amount, :integer, null: false
  end
end
