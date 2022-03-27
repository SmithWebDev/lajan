class ChangeUserstoUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :users_id
    add_reference :accounts, :user, index: true
  end
end
