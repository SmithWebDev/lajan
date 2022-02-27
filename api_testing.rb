StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stockquote, :key))
Alphavantage::Client.new key: Rails.application.credentials.dig(:alphavantage, :key)

def company(symbol)
  StockQuote::Stock.company(symbol)
end

def quote(symbol)
  StockQuote::Stock.quote(symbol)
end

def dividend_history(symbol)
  StockQuote::Stock.batch('dividends', symbol, '5y')
end

def dividend_next(symbol)
  StockQuote::Stock.batch('dividends', symbol, 'next')
end

