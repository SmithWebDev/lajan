class AddDividendAmountToPriceHistoryMonthly < ActiveRecord::Migration[7.0]
  def change
    add_column :price_history_monthlies, :dividend_amount, :integer, null: false
  end
end
