class CreateAccountHoldings < ActiveRecord::Migration[7.0]
  def change
    create_table :account_holdings do |t|
      t.references :company, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
