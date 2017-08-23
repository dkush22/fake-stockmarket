class InAppAccountsController < ApplicationController
  before_action :require_logged_in

  def index
    @inappaccounts = InAppAccount.all
  end

  def show
    @inappaccount = InAppAccount.find(params[:id])
  end

  def edit
    @inappaccount = InAppAccount.find(params[:id])
  end

  def update
    @inappaccount = InAppAccount.find(params[:id])
    if @inappaccount.valid?
      @inappaccount.update(inappaccount_params)
      @inappaccount.save
      redirect_to in_app_account_path(@inappaccount)
    else render 'edit'
    end
  end

  def transfer
    @inappaccount = InAppAccount.find(params[:id])
  end

  def newtransfer
    @bankaccounts = BankAccount.all
    @inappaccount = InAppAccount.find(params[:id])
    current_user.move_money_to_in_app_account(params["transfer"]["amount"].to_i)
    redirect_to user_path(current_user)
  end

  def destroy
    InAppAccount.find(params[:id]).delete
    redirect_to in_app_accounts_path
  end

  private
  def inappaccount_params
    params.require(:in_app_account).permit(:user_id, :amount)
  end



end
