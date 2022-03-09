class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account_name, default: 'default'
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
