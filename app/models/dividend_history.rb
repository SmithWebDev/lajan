# == Schema Information
#
# Table name: dividend_histories
#
#  id            :bigint           not null, primary key
#  amount        :float
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
class DividendHistory < ApplicationRecord
  belongs_to :company
end
