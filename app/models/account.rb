# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  account_name :string           default("default")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  users_id     :bigint           not null
#
# Indexes
#
#  index_accounts_on_users_id  (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (users_id => users.id)
#
class Account < ApplicationRecord
  belongs_to :users
  has_many :account_holdings
  has_many :companies, through: :account_holdings
end
