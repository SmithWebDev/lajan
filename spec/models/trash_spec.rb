# == Schema Information
#
# Table name: trashes
#
#  id                 :bigint           not null, primary key
#  dividend_per_share :float
#  dividend_yield     :float
#  ebitda             :float
#  eps                :float
#  fiscalyearend      :date
#  latestquarter      :date
#  peratio            :float
#  shares_outstanding :string
#  year_high          :float
#  year_low           :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint           not null
#
# Indexes
#
#  index_trashes_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require 'rails_helper'

RSpec.describe Trash, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
