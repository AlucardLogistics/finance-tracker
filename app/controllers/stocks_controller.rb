class StocksController < ApplicationController
  
  def search
    #if params[:stock] <- if is a valid search 
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      #if we already looked for a stock it will be stored in @stcok 
      #if not it will go trough Stock.new_from_lookup
      @stock ||= Stock.new_from_lookup(params[:stock])
    end
    
    if @stock
      #render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
  
end