Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
# Using Alphavantage API, these are some of the endpoints of interest
# ----------------------------------------
client.stock(symbol:).fundamental_data.overview.keys
symbol = client.stock(symbol:).fundamental_data.overview['Symbol']
cik = client.stock(symbol:).fundamental_data.overview['CIK']
name = client.stock(symbol:).fundamental_data.overview['Name']
description = client.stock(symbol:).fundamental_data.overview['Description']
sector = client.stock(symbol:).fundamental_data.overview['Sector']
industry = client.stock(symbol:).fundamental_data.overview['Industry']
ebitda = client.stock(symbol:).fundamental_data.overview['EBITDA']
dividend_yield = client.stock(symbol:).fundamental_data.overview['DividendYield']
roe = client.stock(symbol:).fundamental_data.overview['ReturnOnEquityTTM']

client.stock(symbol: "F").fundamental_data.balance_sheets["annualReports"][0].keys
client.stock(symbol: "F").fundamental_data.balance_sheets["quarterlyReports"][0].keys

client.stock(symbol: "F").fundamental_data.income_statements["annualReports"][0].keys
client.stock(symbol: "F").fundamental_data.income_statements["quarterlyReports"][0].keys

client.stock(symbol: "F").fundamental_data.cash_flow_statements["annualReports"][0].keys
client.stock(symbol: "F").fundamental_data.cash_flow_statements["quarterlyReports"][0].keys

# definitions to add to tooltip
# ----------------------------------------
# ROE = Return on Equity (or ROE) is calculated as income divided by average shareholder equity (past 12 months, including reinvested earnings). The income number is listed on a company's Income Statement. Shareholder Equity (which is the difference between Total Assets and Total Liabilities) can be found on the Balance Sheet.
