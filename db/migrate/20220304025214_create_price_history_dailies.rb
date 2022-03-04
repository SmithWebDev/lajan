class CreatePriceHistoryDailies < ActiveRecord::Migration[7.0]
  def change
    create_table :price_history_dailies do |t|
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.bigint :volume
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
