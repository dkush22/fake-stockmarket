class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :stock



def make_investment(quantity)
  quantity = quantity.to_i
    user.in_app_account.amount -= (stock.stock_price * quantity)
    user.in_app_account.save
end

end
