desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_stock_info: :environment do
  # API key access
  company = Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
  stock = StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))
  business = Polygonio::Rest::Client(Rails.application.credentials.dig(:polygonio, :key))

  list_of_companies = %w[HD AAPL O IRM ARR GROW GAIN LAND]

  list_of_companies.each do |c|
    # API call variables
    # weekly_timeseries = company.stock(symbol: c).timeseries(outputsize: 'full', adjusted: true,
    #                                                         type: 'weekly').output['Weekly Adjusted Time Series']
    # monthly_timeseries = company.stock(symbol: c).timeseries(outputsize: 'full', adjusted: true,
    #                                                          type: 'monthly').output['Monthly Adjusted Time Series']
    business_data = company.stock(symbol: c).fundamental_data.overview

    Company.find_or_create_by(
      name: business_data['Name'],
      symbol: business_data['Symbol'],
      cik: business_data['CIK'],
      description: business_data['Description']
    )
  end
end
