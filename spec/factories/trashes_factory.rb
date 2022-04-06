FactoryBot.define do
  factory :trash do
    fiscalyearend { "2022-04-05" }
    latestquarter { "2022-04-05" }
    dividend_per_share { 1.5 }
    dividend_yield { 1.5 }
    eps { 1.5 }
    year_high { 1.5 }
    year_low { 1.5 }
    company { nil }
    ebitda { 1.5 }
    shares_outstanding { "MyString" }
    peratio { 1.5 }
  end
end
