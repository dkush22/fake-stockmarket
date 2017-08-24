class InvestmentsController < ApplicationController
  before_action :require_logged_in

def index
	@investments = Investment.all
end

def new
  @investment = Investment.new
end

def create
  @investment = Investment.new(user_id: current_user.id, stock_id: params[:investment][:stock_id], quantity: params[:investment][:quantity])
  if !current_user.bank_accounts.first.nil? && @investment.valid?
  	@investment.save
  if @investment.make_investment(params[:investment][:quantity])
  redirect_to user_path(current_user)
    else
    render 'new'
    flash[:message] = "You don't sufficient funds!"
    end
  end
end


end
