# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  cik                :integer
#  description        :text
#  dividend_per_share :float
#  dividend_yield     :float
#  ebitda             :bigint
#  eps                :float
#  exchange           :string
#  fiscalyearend      :date
#  industry           :string
#  latestquarter      :date
#  name               :string
#  peratio            :float
#  sector             :string
#  shares_outstanding :bigint
#  symbol             :string
#  year_high          :float
#  year_low           :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Company < ApplicationRecord
  has_many :price_history_dailies
  has_many :price_history_weeklies
  has_many :price_history_monthlies
  has_many :dividend_histories
  has_many :account_holdings
  has_many :accounts, through: :account_holdings
end
