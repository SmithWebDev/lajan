Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)

# definitions to add to tooltip
# ----------------------------------------
# ROE = Return on Equity (or ROE) is calculated as income divided by average shareholder equity (past 12 months, including reinvested earnings). The income number is listed on a company's Income Statement. Shareholder Equity (which is the difference between Total Assets and Total Liabilities) can be found on the Balance Sheet.

# Using Alphavantage API, these are some of the endpoints of interest
# ----------------------------------------

# TIMESERIES DATA
# =================================================================
client.stock(symbol: ).timeseries.output["Time Series (Daily)"][#{each date}].keys  #=> Daily Time Series information (premium req for adjusted data)
["1. open", "2. high", "3. low", "4. close", "5. volume"]
client.stock(symbol: ).timeseries(outputsize: "full", adjusted: true, type: "monthly").output["Monthly Adjusted Time Series"][#{each date}].keys  #=> Monthly Time Series Information (premium not required)
["1. open", "2. high", "3. low", "4. close", "5. adjusted close", "6. volume", "7. dividend amount"]

# FUNDAMENTAL DATA
# =================================================================
client.stock(symbol: ).fundamental_data.overview.keys
["Symbol", "AssetType", "Name", "Description", "CIK", "Exchange", "Currency", "Country", "Sector", "Industry", "Address", "FiscalYearEnd", "LatestQuarter", "MarketCapitalization", "EBITDA", "PERatio", "PEGRatio", "BookValue", "DividendPerShare", "DividendYield", "EPS", "RevenuePerShareTTM", "ProfitMargin", "OperatingMarginTTM", "ReturnOnAssetsTTM", "ReturnOnEquityTTM", "RevenueTTM", "GrossProfitTTM", "DilutedEPSTTM", "QuarterlyEarningsGrowthYOY", "QuarterlyRevenueGrowthYOY", "AnalystTargetPrice", "TrailingPE", "ForwardPE", "PriceToSalesRatioTTM", "PriceToBookRatio", "EVToRevenue", "EVToEBITDA", "Beta", "52WeekHigh", "52WeekLow", "50DayMovingAverage", "200DayMovingAverage", "SharesOutstanding", "DividendDate", "ExDividendDate"]

client.stock(symbol: ).fundamental_data.balance_sheets["annualReports" or "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "totalAssets", "totalCurrentAssets", "cashAndCashEquivalentsAtCarryingValue", "cashAndShortTermInvestments", "inventory", "currentNetReceivables", "totalNonCurrentAssets", "propertyPlantEquipment", "accumulatedDepreciationAmortizationPPE", "intangibleAssets", "intangibleAssetsExcludingGoodwill", "goodwill", "investments", "longTermInvestments", "shortTermInvestments", "otherCurrentAssets", "otherNonCurrrentAssets", "totalLiabilities", "totalCurrentLiabilities", "currentAccountsPayable", "deferredRevenue", "currentDebt", "shortTermDebt", "totalNonCurrentLiabilities", "capitalLeaseObligations", "longTermDebt", "currentLongTermDebt", "longTermDebtNoncurrent", "shortLongTermDebtTotal", "otherCurrentLiabilities", "otherNonCurrentLiabilities", "totalShareholderEquity", "treasuryStock", "retainedEarnings", "commonStock", "commonStockSharesOutstanding"]

client.stock(symbol: ).fundamental_data.income_statements["annualReports" or "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "grossProfit", "totalRevenue", "costOfRevenue", "costofGoodsAndServicesSold", "operatingIncome", "sellingGeneralAndAdministrative", "researchAndDevelopment", "operatingExpenses", "investmentIncomeNet", "netInterestIncome", "interestIncome", "interestExpense", "nonInterestIncome", "otherNonOperatingIncome", "depreciation", "depreciationAndAmortization", "incomeBeforeTax", "incomeTaxExpense", "interestAndDebtExpense", "netIncomeFromContinuingOperations", "comprehensiveIncomeNetOfTax", "ebit", "ebitda", "netIncome"]

client.stock(symbol: ).fundamental_data.cash_flow_statements["annualReports" or "quarterlyReports"][0].keys
["fiscalDateEnding", "reportedCurrency", "operatingCashflow", "paymentsForOperatingActivities", "proceedsFromOperatingActivities", "changeInOperatingLiabilities", "changeInOperatingAssets", "depreciationDepletionAndAmortization", "capitalExpenditures", "changeInReceivables", "changeInInventory", "profitLoss", "cashflowFromInvestment", "cashflowFromFinancing", "proceedsFromRepaymentsOfShortTermDebt", "paymentsForRepurchaseOfCommonStock", "paymentsForRepurchaseOfEquity", "paymentsForRepurchaseOfPreferredStock", "dividendPayout", "dividendPayoutCommonStock", "dividendPayoutPreferredStock", "proceedsFromIssuanceOfCommonStock", "proceedsFromIssuanceOfLongTermDebtAndCapitalSecuritiesNet", "proceedsFromIssuanceOfPreferredStock", "proceedsFromRepurchaseOfEquity", "proceedsFromSaleOfTreasuryStock", "changeInCashAndCashEquivalents", "changeInExchangeRate", "netIncome"]

# SECTOR DATA
# =================================================================
client.sector.output.keys
["Meta Data", "Rank A: Real-Time Performance", "Rank B: 1 Day Performance", "Rank C: 5 Day Performance", "Rank D: 1 Month Performance", "Rank E: 3 Month Performance", "Rank F: Year-to-Date (YTD) Performance", "Rank G: 1 Year Performance", "Rank H: 3 Year Performance", "Rank I: 5 Year Performance", "Rank J: 10 Year Performance"]
