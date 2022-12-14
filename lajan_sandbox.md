u = User.first
accounts = u.accounts
account_holdings = u.accounts.first.account_holdings
first_company = u.accounts.first.account_holdings.first.company
first_company_cps = u.accounts.first.account_holdings.first.cost_per_share
first_company_shares = u.accounts.first.account_holdings.first.shares
ompanies_in_account = u.accounts.first.companies
