# == Schema Information
#
# Table name: price_history_weeklies
#
#  id              :bigint           not null, primary key
#  adjusted_close  :float            not null
#  close           :float            not null
#  date            :datetime         not null
#  dividend_amount :float            not null
#  high            :float            not null
#  low             :float            not null
#  open            :float            not null
#  volume          :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#
# Indexes
#
#  index_price_history_weeklies_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class PriceHistoryWeekly < ApplicationRecord
  belongs_to :company
end
