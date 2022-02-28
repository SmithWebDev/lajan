FactoryBot.define do
  factory :price_history_monthly do
    open { 1 }
    low { 1 }
    high { 1 }
    close { 1 }
    adjusted_close { 1 }
    volume { 1 }
    date { "2022-02-27 23:07:26" }
    company { nil }
  end
end
