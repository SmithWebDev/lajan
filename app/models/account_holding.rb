# == Schema Information
#
# Table name: account_holdings
#
#  id             :bigint           not null, primary key
#  cost_per_share :float
#  shares         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint           not null
#  company_id     :bigint           not null
#
# Indexes
#
#  index_account_holdings_on_account_id  (account_id)
#  index_account_holdings_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (company_id => companies.id)
#
class AccountHolding < ApplicationRecord
  belongs_to :company
  belongs_to :account

  def total_shares_owned
  end
end
