class RemoveAmountFromInvestments < ActiveRecord::Migration[5.1]
  def change
    remove_column :investments, :amount
  end
end
