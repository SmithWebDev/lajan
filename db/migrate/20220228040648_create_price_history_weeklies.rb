class CreatePriceHistoryWeeklies < ActiveRecord::Migration[7.0]
  def change
    create_table :price_history_weeklies do |t|
      t.float :open, null: false
      t.float :high, null: false
      t.float :low, null: false
      t.float :close, null: false
      t.float :adjusted_close, null: false
      t.float :dividend_amount, null: false
      t.bigint :volume, null: false
      t.datetime :date, null: false
      t.references :company, null: false, foreign_key: true
      t.timestamps
    end
  end
end
