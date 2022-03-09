# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  account_name :string           default("default")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  users_id     :bigint           not null
#
# Indexes
#
#  index_accounts_on_users_id  (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (users_id => users.id)
#
require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
