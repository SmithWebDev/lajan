FactoryBot.define do
  factory :price_history_weekly do
    open { 1 }
    high { 1 }
    low { 1 }
    close { 1 }
    adjusted_close { 1 }
    volume { 1 }
    company { nil }
    date { "2022-02-27 23:06:48" }
  end
end
