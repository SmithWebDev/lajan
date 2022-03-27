# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  account_name :string           default("default")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
