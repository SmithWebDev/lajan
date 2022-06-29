desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_api_calls: :environment do
  # API key access
  client = Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
  stock  = StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))
  # business = Polygonio::Rest::Client(Rails.application.credentials.dig(:polygonio, :key))
  list_of_companies = %w[BXMT MAIN INTC BRMK HD AAPL UGI MO MMM O IRM ARR GROW GAIN LAND CAT ADP MPLX CC LADR JPM APD PEP PPL WM XOM NEE SJT PVL CRT ORC PII FMS GS ABT TMO ORCL UNP LLY AXP AJX AB WMC RC NLY FSK NYMT VALE SBLK ZIM CVX WBA LEG PM VZ UVV KMI EPD ABR ARE EQR QCOM CSCO T DVN IBM ENB]
  # list_of_companies = %w[T DVN IBM ENB]

  list_of_companies.each do |company|
    # API call variables
    company_info = client.stock(symbol: company).fundamental_data.overview
    daily         = client.stock(symbol: company).timeseries(outputsize: 'full').output['Time Series (Daily)']

    past_dividend = StockQuote::Stock.batch('dividends', company, '5y')
    next_dividend = StockQuote::Stock.batch('dividends', company, 'next')

    c = Company.find_or_create_by(
      name: company_info['Name'],
      symbol: company_info['Symbol'],
      cik: company_info['CIK'],
      description: company_info['Description'],
      exchange: company_info['Exchange'],
      sector: company_info['Sector'],
      industry: company_info['Industry']
    )
    CompanyInfo.create_with(
      company_id: c.id,
      fiscalyearend: company_info['FiscalYearEnd'],
      latestquarter: company_info['LatestQuarter'],
      ebitda: company_info['EBITDA'],
      peratio: company_info['PERatio'],
      dividend_per_share: company_info['DividendPerShare'],
      dividend_yield: company_info['DividendYield'],
      eps: company_info['EPS'],
      year_high: company_info['52WeekHigh'],
      year_low: company_info['52WeekLow'],
      shares_outstanding: company_info['SharesOutstanding']
    ).find_or_create_by(company_id: c.id, latestquarter: company_info['LatestQuarter'])
    puts "#{company_info['Name']} added"

    # monthly.each do |month|
    #   PriceHistoryMonthly.create_with(
    #     company_id: c.id,
    #     open: month[1]['1. open'].to_f,
    #     high: month[1]['2. high'].to_f,
    #     low: month[1]['3. low'].to_f,
    #     close: month[1]['4. close'].to_f,
    #     adjusted_close: month[1]['5. adjusted close'].to_f,
    #     volume: month[1]['6. volume'],
    #     dividend_amount: month[1]['7. dividend amount'].to_f,
    #     date: month[0]
    #   ).find_or_create_by(company_id: c.id, date: month[0])
    # end
    # puts "#{company_info['Name']} monthly price history added"

    # weekly.each do |week|
    #   PriceHistoryWeekly.create_with(
    #     company_id: c.id,
    #     open: week[1]['1. open'].to_f,
    #     high: week[1]['2. high'].to_f,
    #     low: week[1]['3. low'].to_f,
    #     close: week[1]['4. close'].to_f,
    #     adjusted_close: week[1]['5. adjusted close'].to_f,
    #     volume: week[1]['6. volume'],
    #     dividend_amount: week[1]['7. dividend amount'].to_f,
    #     date: week[0]
    #   ).find_or_create_by(company_id: c.id, date: week[0])
    # end
    # puts "#{company_info['Name']} weekly price history added"

    daily.each do |day|
      PriceHistoryDaily.create_with(
        company_id: c.id,
        open: day[1]['1. open'].to_f,
        high: day[1]['2. high'].to_f,
        low: day[1]['3. low'].to_f,
        close: day[1]['4. close'].to_f,
        volume: day[1]['5. volume'],
        date: day[0]
      ).find_or_create_by(company_id: c.id, date: day[0])
    end
    puts "#{company_info['Name']} daily price history added"

    next_dividend.dividends.each do |div|
      DividendHistory.create_with(
        company_id: c.id,
        amount: div['amount'],
        declared_date: div['declaredDate'],
        exdate: div['exDate'],
        frequency: div['frequency'],
        payment_date: div['paymentDate'],
        record_date: div['recordDate']
      ).find_or_create_by(company_id: c.id, declared_date: div['declaredDate'])
    end
    puts "#{company_info['Name']} next dividend added"

    past_dividend.dividends.each do |div|
      DividendHistory.create_with(
        company_id: c.id,
        amount: div['amount'],
        declared_date: div['declaredDate'],
        exdate: div['exDate'],
        frequency: div['frequency'],
        payment_date: div['paymentDate'],
        record_date: div['recordDate']
      ).find_or_create_by(company_id: c.id, declared_date: div['declaredDate'])
    end
    puts "#{company_info['Name']} past dividend history added"

    sleep 30
  end
end
