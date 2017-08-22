class BankAccount < ApplicationRecord
  belongs_to :in_app_account
  belongs_to :user


end
