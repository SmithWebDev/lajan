FactoryBot.define do
  factory :price_history_daily do
    open { 1.5 }
    high { 1.5 }
    low { 1.5 }
    close { 1.5 }
    volume { "" }
    company { nil }
  end
end
