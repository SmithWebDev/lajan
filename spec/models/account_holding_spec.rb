# == Schema Information
#
# Table name: account_holdings
#
#  id             :bigint           not null, primary key
#  cost_per_share :float
#  shares         :float
#  total_cost     :float
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
require 'rails_helper'

RSpec.describe AccountHolding, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
