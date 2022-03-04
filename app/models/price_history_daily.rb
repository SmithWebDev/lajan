# == Schema Information
#
# Table name: price_history_dailies
#
#  id         :bigint           not null, primary key
#  close      :float
#  date       :datetime
#  high       :float
#  low        :float
#  open       :float
#  volume     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_price_history_dailies_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class PriceHistoryDaily < ApplicationRecord
  belongs_to :company
end
