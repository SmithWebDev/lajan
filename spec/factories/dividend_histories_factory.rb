FactoryBot.define do
  factory :dividend_history do
    amount { 1 }
    declared_date { "2022-02-28 04:48:05" }
    exdate { "2022-02-28 04:48:05" }
    frequency { "MyString" }
    payment_date { "2022-02-28 04:48:05" }
    record_date { "2022-02-28 04:48:05" }
    company { nil }
  end
end
