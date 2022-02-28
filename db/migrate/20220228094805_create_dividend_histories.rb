class CreateDividendHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :dividend_histories do |t|
      t.integer :amount
      t.datetime :declared_date
      t.datetime :exdate
      t.string :frequency
      t.datetime :payment_date
      t.datetime :record_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
