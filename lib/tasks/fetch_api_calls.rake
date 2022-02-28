desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_stock_info: :environment do
  # API key access
  client = Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
  stock = StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))
  business = Polygonio::Rest::Client(Rails.application.credentials.dig(:polygonio, :key))

  list_of_companies = %w[HD AAPL O IRM ARR GROW GAIN LAND]

  list_of_companies.each do |company|
    # API call variables
    weekly = client.stock(symbol: company).timeseries(outputsize: 'full', adjusted: true,
                                                       type: 'weekly').output['Weekly Adjusted Time Series']
    monthly = client.stock(symbol: company).timeseries(outputsize: 'full', adjusted: true,
                                                        type: 'monthly').output['Monthly Adjusted Time Series']
    business_data = client.stock(symbol: company).fundamental_data.overview

    Company.find_or_create_by(
      name: business_data['Name'],
      symbol: business_data['Symbol'],
      cik: business_data['CIK'],
      description: business_data['Description']
    )

    monthly.each do |month|
      PriceHistoryMonthly.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        date: month,
        open: month['1. open'],
        high: month['2. high'],
        low: month['3. low'],
        close: month['4. close'],
        adjusted_close: month['5. adjusted close'],
        volume: month['6. volume']
      )
    end

    weekly.each do |week|
      PriceHistoryWeekly.find_or_create_by(
        company_id: Company.find_by(symbol: company).id,
        date: week,
        open: week['1. open'],
        high: week['2. high'],
        low: week['3. low'],
        close: week['4. close'],
        adjusted_close: week['5. adjusted close'],
        volume: week['6. volume']
      )
    end
  end
end
