class User < ApplicationRecord
  has_one :in_app_account
  has_many :bank_accounts
  has_many :stocks, through: :investments
  has_many  :investments
  has_secure_password

  def move_money_to_in_app_account(transfer_amount)

    first_bank_account = self.bank_accounts.first
    transfer_amount = transfer_amount.to_i
    first_bank_account.total_money -= transfer_amount
    first_bank_account.save
    self.in_app_account.amount += transfer_amount
    self.in_app_account.save
  end


end

# t = Transfer.new(in_app_account, bank_acount)
# t.transfer(50)
