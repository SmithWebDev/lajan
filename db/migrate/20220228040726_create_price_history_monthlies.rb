class CreatePriceHistoryMonthlies < ActiveRecord::Migration[7.0]
  def change
    create_table :price_history_monthlies do |t|
      t.integer :open, null: false
      t.integer :low, null: false
      t.integer :high, null: false
      t.integer :close, null: false
      t.integer :adjusted_close, null: false
      t.integer :volume, null: false
      t.datetime :date, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
