# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  account_name :string           default("Default Portfolio")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
class Account < ApplicationRecord
  belongs_to :user
  has_many :account_holdings, dependent: :destroy
  has_many :companies, through: :account_holdings
end
