desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_stock_info: :environment do
  company = Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)
  stock = StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))

  list_of_companies = %w[AAPL O IRM ARR GROW GAIN LAND]

  list_of_companies.each do |company|
  end
end
