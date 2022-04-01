FactoryBot.define do
  factory :company_info do
    fiscalyearend { "2022-04-01" }
    latestquarter { "2022-04-01" }
    ebitda { "" }
    peratio { 1.5 }
    dividend_per_share { 1.5 }
    dividend_yield { 1.5 }
    eps { 1.5 }
    year_high { 1.5 }
    year_low { 1.5 }
    shares_outstanding { "" }
    company { nil }
  end
end
