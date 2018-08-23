class StocksController < ApplicationController
	def search
		if params[:stock].present?
			@stock = Stock.new_from_lookup(params[:stock])
			if @stock.nil?
				flash[:danger] = "Keyword #{params[:stock]} not found Please enter a valid tickle"
				redirect_to my_portfolio_path
			else
				respond_to do |format|
					format.js{ render partial: 'users/result'}
				end
			end
		else
			flash[:danger] = "Please enter a ticker"
			render 'users/my_portfolio'
		end
		
	end
end