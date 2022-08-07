# Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
# StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))

# definitions to add to tooltip
# ----------------------------------------
# ROE = Return on Equity (or ROE) is calculated as income divided by average shareholder equity (past 12 months, including reinvested earnings). The income number is listed on a company's Income Statement. Shareholder Equity (which is the difference between Total Assets and Total Liabilities) can be found on the Balance Sheet.
# Common Stock = Shareholders have voting rights
# Preferred Stock = Shareholders have no voting rights

# Dividend definitions
# ----------------------------------------
# Ex-Dividend Date = The day on which all shares bought and sold no longer come attached with the right to be paid the most recently declared dividend. You must own a stock before the ex-dividend date in order to receive the next scheduled dividend. Selling the stock prior to this date, loses their right to the dividend. On and after this date the stock become 'ex dividend (without dividend)', owners of the stock will receive the dividend even if they now sell the stock.

# Record Date = Shareholders who properly registered their ownership on or before the record date (or "date of record") will receive the dividend.

# Payment Date = The day when the dividend checks will actually be mailed to the shareholders of a company/credited to a brokerage account.

# Declaration Date = The day on which a company's board of directors announces its next dividend payment.

# Dividend Yield = An easy way to compare the relative attractiveness of various dividend paying stocks. Dividend Yield is the relation between a stock's annual dividend payout and its current stock price. Depending on how much a stock price moves during the day, the yield is constantly changing as the stock price changes.
# DividendYield is calculated using the annual yield
# DividendYield = AnnualDividend/CurrentStockPrice

#

# Using Alphavantage API, these are some of the endpoints of interest
# ----------------------------------------

# TIMESERIES DATA
# =================================================================
client.stock(symbol: ).timeseries.output["Time Series (Daily)"][#{each date}].keys  #=> Daily Time Series information (premium req for adjusted data)
["1. open", "2. high", "3. low", "4. close", "5. volume"],

client.stock(symbol: ).timeseries(outputsize: "full", adjusted: true, type: "monthly").output["Monthly Adjusted Time Series"][#{each date}].keys  #=> Monthly Time Series Information (premium not required)
["1. open", "2. high", "3. low", "4. close", "5. adjusted close", "6. volume", "7. dividend amount"],
client.stock(symbol: ).timeseries(outputsize: "full", adjusted: true, type: "weekly").output["Weekly Adjusted Time Series"][#{each date}].keys  #=> Monthly Time Series Information (premium not required)
["1. open", "2. high", "3. low", "4. close", "5. adjusted close", "6. volume", "7. dividend amount"],

# FUNDAMENTAL DATA
# =================================================================
client.stock(symbol: ).fundamental_data.overview.keys,
["Symbol", "AssetType", "Name", "Description", "CIK", "Exchange", "Currency", "Country", "Sector", "Industry", "Address", "FiscalYearEnd", "LatestQuarter", "MarketCapitalization", "EBITDA", "PERatio", "PEGRatio", "BookValue", "DividendPerShare", "DividendYield", "EPS", "RevenuePerShareTTM", "ProfitMargin", "OperatingMarginTTM", "ReturnOnAssetsTTM", "ReturnOnEquityTTM", "RevenueTTM", "GrossProfitTTM", "DilutedEPSTTM", "QuarterlyEarningsGrowthYOY", "QuarterlyRevenueGrowthYOY", "AnalystTargetPrice", "TrailingPE", "ForwardPE", "PriceToSalesRatioTTM", "PriceToBookRatio", "EVToRevenue", "EVToEBITDA", "Beta", "52WeekHigh", "52WeekLow", "50DayMovingAverage", "200DayMovingAverage", "SharesOutstanding", "DividendDate", "ExDividendDate"],

client.stock(symbol: ).fundamental_data.balance_sheets["annualReports" || "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "totalAssets", "totalCurrentAssets", "cashAndCashEquivalentsAtCarryingValue", "cashAndShortTermInvestments", "inventory", "currentNetReceivables", "totalNonCurrentAssets", "propertyPlantEquipment", "accumulatedDepreciationAmortizationPPE", "intangibleAssets", "intangibleAssetsExcludingGoodwill", "goodwill", "investments", "longTermInvestments", "shortTermInvestments", "otherCurrentAssets", "otherNonCurrrentAssets", "totalLiabilities", "totalCurrentLiabilities", "currentAccountsPayable", "deferredRevenue", "currentDebt", "shortTermDebt", "totalNonCurrentLiabilities", "capitalLeaseObligations", "longTermDebt", "currentLongTermDebt", "longTermDebtNoncurrent", "shortLongTermDebtTotal", "otherCurrentLiabilities", "otherNonCurrentLiabilities", "totalShareholderEquity", "treasuryStock", "retainedEarnings", "commonStock", "commonStockSharesOutstanding"],

client.stock(symbol: ).fundamental_data.income_statements["annualReports" or "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "grossProfit", "totalRevenue", "costOfRevenue", "costofGoodsAndServicesSold", "operatingIncome", "sellingGeneralAndAdministrative", "researchAndDevelopment", "operatingExpenses", "investmentIncomeNet", "netInterestIncome", "interestIncome", "interestExpense", "nonInterestIncome", "otherNonOperatingIncome", "depreciation", "depreciationAndAmortization", "incomeBeforeTax", "incomeTaxExpense", "interestAndDebtExpense", "netIncomeFromContinuingOperations", "comprehensiveIncomeNetOfTax", "ebit", "ebitda", "netIncome"],

client.stock(symbol: ).fundamental_data.cash_flow_statements["annualReports" or "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "operatingCashflow", "paymentsForOperatingActivities", "proceedsFromOperatingActivities", "changeInOperatingLiabilities", "changeInOperatingAssets", "depreciationDepletionAndAmortization", "capitalExpenditures", "changeInReceivables", "changeInInventory", "profitLoss", "cashflowFromInvestment", "cashflowFromFinancing", "proceedsFromRepaymentsOfShortTermDebt", "paymentsForRepurchaseOfCommonStock", "paymentsForRepurchaseOfEquity", "paymentsForRepurchaseOfPreferredStock", "dividendPayout", "dividendPayoutCommonStock", "dividendPayoutPreferredStock", "proceedsFromIssuanceOfCommonStock", "proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet", "proceedsFromIssuanceOfPreferredStock", "proceedsFromRepurchaseOfEquity", "proceedsFromSaleOfTreasuryStock", "changeInCashAndCashEquivalents", "changeInExchangeRate", "netIncome"],

# SECTOR DATA
# =================================================================
client.sector.output.keys
["Meta Data", "Rank A: Real-Time Performance", "Rank B: 1 Day Performance", "Rank C: 5 Day Performance", "Rank D: 1 Month Performance", "Rank E: 3 Month Performance", "Rank F: Year-to-Date (YTD) Performance", "Rank G: 1 Year Performance", "Rank H: 3 Year Performance", "Rank I: 5 Year Performance", "Rank J: 10 Year Performance"],

# Investing Strategy
# =================================================================

# "Dividend Capture" = an attempt to collect the dividend and immediately sell the stock.

# Stock Tickers of Interest
# =================================================================

# Dividend Friendly Industries = REITs, MLPs, Tobacco, Telecommunications, Utilities

# Test Companies for project
%w[HD AAPL O IRM ARR GROW GAIN LAND MMM MO OMC TROW UGI],

# Monthly Paying Common Stocks (Does not include preferred not ETF/Exchange Traded Notes)
%w[ADR, AGNC, ARR, AVAL, BBD, BRMK, CRT, DRETF, DREUF, EFC, EIFZF, EPR, GAIN, GLAD, GOOD, GROW, GWRS, HRZN, IPPLF, ITUB, LAND, LTC, MAIN, MTR, O, ORC, OXSQ, PBA, PBT, PFLT, PPRQF, PRT, PSEC, PVL, SBR, SCM, SJR, SJT, SLG, STAG, SUNS, SUUIF, TRSWF, WSR, EIC],

# Fetch_stock_info
client.stock(symbol: symbol).timeseries(outputsize: "full", adjusted: true, type: "weekly").output["Weekly Adjusted Time Series"].each do |week|
  weekly_date: week
  open: week["1. open"],
  high: week["2. high"],
  low: week["3. low"],
  close: week["4. close"],
  adjusted_close: week["5. adjusted close"],
  volume: week["6. volume"]
end

client.stock(symbol: symbol).timeseries(outputsize: "full", adjusted: true, type: "monthly").output["Monthly Adjusted Time Series"].each do |month|
  monthly_date: month
  open: month["1. open"],
  high: month["2. high"],
  low: month["3. low"],
  close: month["4. close"],
  adjusted_close: month["5. adjusted close"],
  volume: month["6. volume"]
end

client.stock(symbol: symbol).fundamental_data.overview.each do |data|
  company_symbol: symbol,
  name: data["Name"],
  description: data["Description"],
  cik: data["CIK"],
  sector: data["Sector"],
  Industry: data["Industry"]
end


