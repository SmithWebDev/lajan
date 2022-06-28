class RemoveDefaultFromAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:accounts, :account_name, nil)
  end
end
