# Using Alphavantage API, these are some of the endpoints of interest
# ----------------------------------------
symbol = client.stock(symbol:).fundamental_data.overview['Symbol']
cik = client.stock(symbol:).fundamental_data.overview['CIK']
name = client.stock(symbol:).fundamental_data.overview['Name']
description = client.stock(symbol:).fundamental_data.overview['Description']
sector = client.stock(symbol:).fundamental_data.overview['Sector']
industry = client.stock(symbol:).fundamental_data.overview['Industry']
ebitda = client.stock(symbol:).fundamental_data.overview['EBITDA']
dividend_yield = client.stock(symbol:).fundamental_data.overview['DividendYield']
roe = client.stock(symbol:).fundamental_data.overview['ReturnonEquityTTM']

# definitions to add to tooltip
# ----------------------------------------
# ROE = Return on Equity (or ROE) is calculated as income divided by average shareholder equity (past 12 months, including reinvested earnings). The income number is listed on a company's Income Statement. Shareholder Equity (which is the difference between Total Assets and Total Liabilities) can be found on the Balance Sheet.
