class User < ApplicationRecord
  has_many :bank_accounts
  has_many :stocks, through: :investments
  has_one :in_app_account
  accepts_nested_attributes_for :bank_accounts
end
