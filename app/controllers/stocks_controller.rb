class StocksController < ApplicationController
	def search
		if params[:stock].blank?
			flash.now[:danger] = "Please enter a ticker"
		else
			@stock = Stock.new_from_lookup(params[:stock])
			flash.now[:danger] = "Keyword #{params[:stock]} not found Please enter a valid tickle" unless @stock
		end
		render partial: 'users/result'
	end
end 