class StocksController < ApplicationController
	def search
		if params[:stock].present?
			@stock = Stock.new_from_lookup(params[:stock])
			if @stock.nil?
				flash[:danger] = "Keyword #{params[:stock]} not found Please enter a valid tickle"
			end
		else
			flash[:danger] = "Please enter a ticker"
		end
		render 'users/my_portfolio'
	end
end