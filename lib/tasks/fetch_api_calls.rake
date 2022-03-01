desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_api_calls: :environment do
  # API key access
  client = Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
  stock = StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))
  # business = Polygonio::Rest::Client(Rails.application.credentials.dig(:polygonio, :key))

  list_of_companies = %w[HD AAPL O IRM ARR GROW GAIN LAND]

  list_of_companies.each do |company|
    # API call variables
    weekly = client.stock(symbol: company).timeseries(outputsize: 'full', adjusted: true,
                                                      type: 'weekly').output['Weekly Adjusted Time Series']
    monthly = client.stock(symbol: company).timeseries(outputsize: 'full', adjusted: true,
                                                       type: 'monthly').output['Monthly Adjusted Time Series']
    company_info = client.stock(symbol: company).fundamental_data.overview
    past_dividend = StockQuote::Stock.batch('dividends', company, '5y')
    next_dividend = StockQuote::Stock.batch('dividends', company, 'next')

    Company.find_or_create_by(
      name: company_info['Name'],
      symbol: company_info['Symbol'],
      cik: company_info['CIK'],
      description: company_info['Description']
    )
    puts "#{company_info['Name']} added"

    monthly.each do |month|
      PriceHistoryMonthly.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        open: month[1]['1. open'].to_f,
        high: month[1]['2. high'].to_f,
        low: month[1]['3. low'].to_f,
        close: month[1]['4. close'].to_f,
        adjusted_close: month[1]['5. adjusted close'].to_f,
        volume: month[1]['6. volume'],
        dividend_amount: month[1]['7. dividend amount'].to_f,
        date: month[0]
      )
    end
    puts "#{company_info['Name']} monthly price history added"

    weekly.each do |week|
      PriceHistoryWeekly.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        open: week[1]['1. open'].to_f,
        high: week[1]['2. high'].to_f,
        low: week[1]['3. low'].to_f,
        close: week[1]['4. close'].to_f,
        adjusted_close: week[1]['5. adjusted close'].to_f,
        volume: week[1]['6. volume'],
        dividend_amount: week[1]['7. dividend amount'].to_f,
        date: week[0]
      )
    end
    puts "#{company_info['Name']} weekly price history added"

    next_dividend.dividends.each do |div|
      DividendHistory.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        amount: div['amount'],
        declared_date: div['declaredDate'],
        exdate: div['exDate'],
        frequency: div['frequency'],
        payment_date: div['paymentDate'],
        record_date: div['recordDate']
      )
    end
    puts "#{company_info['Name']} next dividend added"

    past_dividend.dividends.each do |div|
      DividendHistory.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        amount: div['amount'],
        declared_date: div['declaredDate'],
        exdate: div['exDate'],
        frequency: div['frequency'],
        payment_date: div['paymentDate'],
        record_date: div['recordDate']
      )
    end
    puts "#{company_info['Name']} past dividend history added"

    sleep 60
  end
end
