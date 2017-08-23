class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  validate :enough_money?



def make_investment(quantity)
  quantity = quantity.to_i
  first_bank_account = user.bank_accounts.first
  if user.in_app_account.amount >= (stock.stock_price * quantity)
  	user.in_app_account.amount -= (stock.stock_price * quantity)
    user.in_app_account.save
elsif first_bank_account.total_money >= (stock.stock_price * quantity)
	first_bank_account.total_money -= (stock.stock_price * quantity)
	first_bank_account.save
else "You are too poor"

end
end

def enough_money?
quantity = self.quantity.to_i
  if ((stock.stock_price * quantity) >= user.in_app_account.amount) && ((stock.stock_price * quantity) >= user.bank_accounts.first.total_money)
 errors.add(:base, message: "Hello")
end
end
end
