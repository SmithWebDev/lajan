# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  cik                :integer
#  description        :text
#  dividend_per_share :float
#  dividend_yield     :float
#  ebitda             :bigint
#  eps                :float
#  exchange           :string
#  fiscalyearend      :date
#  industry           :string
#  latestquarter      :date
#  name               :string
#  peratio            :float
#  sector             :string
#  shares_outstanding :bigint
#  symbol             :string
#  year_high          :float
#  year_low           :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
