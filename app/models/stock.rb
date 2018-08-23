class Stock < ApplicationRecord

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
