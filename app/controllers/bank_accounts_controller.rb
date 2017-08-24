class BankAccountsController < ApplicationController
  before_action :is_authenticated?

def index
  redirect_to user_bankaccounts_path(current_user)
end

def show
  @bankaccount = BankAccount.find(params[:id])
end

def new
  @bankaccount = BankAccount.new
end

def create
  @bankaccount = BankAccount.new(bankaccount_params)
  @bankaccount.user_id = current_user.id
  @bankaccount.in_app_account_id = current_user.in_app_account.id
  if @bankaccount.valid?
    @bankaccount.save
    redirect_to user_path(current_user)
  else render 'new'
  end
end

def edit
  @bankaccount = BankAccount.find(params[:id])
end

def update
  @bankaccount = BankAccount.find(params[:id])
  @bankaccount.update(bankaccount_params)
  if @bankaccount.valid?
    @bankaccount.save
    redirect_to bank_account_path(@bankaccount)
  else render 'edit'
  end
end

def destroy
  BankAccount.find(params[:id]).delete
  redirect_to bank_accounts_path
end

private
def bankaccount_params
  params.require(:bank_account).permit(:name, :type_of_account, :total_money)
end



end
