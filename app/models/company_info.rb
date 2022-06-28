# == Schema Information
#
# Table name: company_infos
#
#  id                 :bigint           not null, primary key
#  dividend_per_share :float
#  dividend_yield     :float
#  ebitda             :bigint
#  eps                :float
#  fiscalyearend      :date
#  latestquarter      :date
#  peratio            :float
#  shares_outstanding :bigint
#  year_high          :float
#  year_low           :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint           not null
#
# Indexes
#
#  index_company_infos_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class CompanyInfo < ApplicationRecord
  belongs_to :company

  default_scope { order(created_at: :asc) }
end
