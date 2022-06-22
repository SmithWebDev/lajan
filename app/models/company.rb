# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  cik         :integer
#  description :text
#  exchange    :string
#  industry    :string
#  name        :string
#  sector      :string
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :company_infos, dependent: :destroy
  has_many :price_history_dailies, dependent: :destroy
  has_many :price_history_weeklies, dependent: :destroy
  has_many :price_history_monthlies, dependent: :destroy
  has_many :dividend_histories, dependent: :destroy
  has_many :account_holdings
  has_many :accounts, through: :account_holdings

  def last_price
    price_history_dailies.last.close
  end

  def dividend_yield
    company_infos.last.dividend_yield * 100
  end

  def dividend_per_share
    company_infos.last.dividend_per_share
  end

  def yield_on_current_close
    (dividend_per_share / last_price) * 100
  end

  # def avg_cost_per_share
  #  account_holdings.average(:cost_per_share).round(2)
  # end

  # def total_shares_owned
  #  account_holding.shares
  # end

  # def annual_dividend_income
  #   dividend_per_share * total_shares_owned
  # end

  def yield_on_cost
    dividend_per_share / account_holdings.cost_per_share
  end
end
