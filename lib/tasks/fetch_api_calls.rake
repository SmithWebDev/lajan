desc 'Pull information from the AlphaVantage and IEX Cloud Stock Api'

task fetch_stock_info: :environment do
  company = Alphavantage::Client.new key: ENV['ALPHA_VANTAGE_KEY']
  stock = StockQuote::Stock.new(api_key: ENV['STOCK_KEY'])

  list_of_companies = %w[AAPL O IRM ARR GROW GAIN LAND]

  list_of_companies.each do
  end
end
