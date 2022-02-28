# == Schema Information
#
# Table name: dividend_histories
#
#  id            :bigint           not null, primary key
#  amount        :integer
#  declared_date :datetime
#  exdate        :datetime
#  frequency     :string
#  payment_date  :datetime
#  record_date   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  company_id    :bigint           not null
#
# Indexes
#
#  index_dividend_histories_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require 'rails_helper'

RSpec.describe DividendHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
