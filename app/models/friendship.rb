class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def transfer_to_friend(transfer_amount)
    first_bank_account = self.user.bank_accounts.first
    if transfer_amount <= self.user.in_app_account.amount
      self.user.in_app_account.amount -= transfer_amount
      self.user.in_app_account.save
      self.friend.in_app_account.amount += transfer_amount
      self.friend.in_app_account.save
  elsif transfer_amount <= first_bank_account.total_money
    first_bank_account.total_money -= transfer_amount
    first_bank_account.save
  else
    ""
  end
end
end
