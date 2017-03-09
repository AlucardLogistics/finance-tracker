class Stock < ActiveRecord::Base
  
  #def class level methods that are not tied to objects
  #that way Stock class can be used w/o any instances of this class
  #the way is defined is: def self.
  
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  def self.new_from_lookup(ticker_symbol)
    
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    #it will return nil if there is no name in the look up (wrong symbol searched)
    return nil unless looked_up_stock.name
      new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
      new_stock.last_price = new_stock.price
      new_stock
    
  end
  
  #returns the closing price if not the open price if not it will return 'Unavailable'
  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} Closing" if closing_price
    
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} Open" if opening_price
    'Unavailable'
  end
  
end
