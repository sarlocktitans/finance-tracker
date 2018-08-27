class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks
	
	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first

	end
	def self.new_from_lookup(tickle)
		begin
			tickle_search = StockQuote::Stock.quote(tickle);
			price = tickle_search.latest_price
			new(name: tickle_search.company_name, ticker: tickle_search.symbol, last_price: price)
		rescue Exception => e
			return nil
		end
	end

	def pricesub(number)
		number.gsub(",", "")
	end
	
end
