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
  has_many :price_history_dailies
  has_many :price_history_weeklies
  has_many :price_history_monthlies
  has_many :dividend_histories
  has_many :account_holdings
  has_many :accounts, through: :account_holdings
  has_many :company_infos
end
