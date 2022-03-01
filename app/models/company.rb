# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  cik         :integer
#  description :text
#  name        :string
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :price_history_weeklies
  has_many :price_history_monthlies
  has_many :dividend_histories
end
