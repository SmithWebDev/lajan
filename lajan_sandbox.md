u = User.first
accounts = u.accounts
account_holdings = u.accounts.first.account_holdings
first_company =  u.accounts.first
                  .account_holdings.first
                  .company
first_company_cps =  u.accounts.first
                      .account_holdings.first
                      .cost_per_share
first_company_shares = u.accounts.first
                        .account_holdings.first
                        .shares
companies_in_account = u.accounts.first.companies
cost_per_share = account_holdings.first.cost_per_share
shares_purchased = account_holdings.first.shares
position_shares_purchased = account_holdings
                            .where(company_id: company_id)
                            .sum(:shares)
avg_cost = (cost_per_share * shares_purchased) / position_total_number_of_shares
dividend_yield_on_cost = (dividend_amount / avg_cost) * 100
annual_income = total_shares_purchased * dividend_amount
profit_loss






drip_adjusted_income =
