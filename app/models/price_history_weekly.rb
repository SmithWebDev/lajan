# == Schema Information
#
# Table name: price_history_weeklies
#
#  id              :bigint           not null, primary key
#  adjusted_close  :integer          not null
#  close           :integer          not null
#  date            :datetime         not null
#  dividend_amount :integer          not null
#  high            :integer          not null
#  low             :integer          not null
#  open            :integer          not null
#  volume          :integer          not null
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
