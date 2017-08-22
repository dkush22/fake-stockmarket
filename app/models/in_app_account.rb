class InAppAccount < ApplicationRecord
  has_many :bank_accounts
  belongs_to :user

end
