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

  def annual_dividend_income; end

  def stock_annual_income
    dividend_amount = company.company_infos.last.dividend_per_share
    shares * dividend_amount
  end

  def yield_on_cost
    dividend_amount = company.company_infos.last.dividend_per_share
    (dividend_amount / cost_per_share) * 100
  end

  def principle_invested
    shares * cost_per_share
  end

  def profit_loss
    company.price_history_dailies.last.close - cost_per_share
  end

  def amount_invested; end
end
