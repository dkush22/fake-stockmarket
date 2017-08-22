class StocksController < ApplicationController
  skip_before_action :current_user, only: [:index, :show]
def index
  @stocks = Stock.all
end

def show
  @stock = Stock.find(params[:id])
end

def new
  if logged_in?
    @stock = Stock.new
  end
end

def create
  if logged_in?
    @stock = Stock.new(stock_params)
    if @stock.valid?
      @stock.save
      redirect_to stock_path(@stock)
    else render 'new'
    end
  end
end


def edit
  @stock = Stock.find(params[:id])
end

def update
  @stock = Stock.find(params[:id])
  @stock.update(stock_params)
  if @stock.valid?
    @stock.save
    redirect_to stock_path(@stock)
  else render 'edit'
  end
end

def destroy
  Stock.find(params[:id]).delete
  redirect_to stocks_path
end

private


def stock_params
  params.require(:stock).permit(:name, :ticker, :market_cap, :stock_price)
end

end
