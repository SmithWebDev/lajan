# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  cik         :integer
#  description :text
#  exchange    :string
#  industry    :string
#  name        :string
#  sector      :string
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
