class InAppAccountsController < ApplicationController

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

def newtransfer
  @inappaccount = InAppAccount.find(params[:id])
  current_user.move_money_to_in_app_account(params[:amount])
end

def transfer
  @inappaccount = InAppAccount.find(params[:id])
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
