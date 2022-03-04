class AddDateToPriceHistoryDaily < ActiveRecord::Migration[7.0]
  def change
    add_column :price_history_dailies, :date, :datetime
  end
end
