class AddQuantityToInvestments < ActiveRecord::Migration[5.1]
  def change
    add_column :investments, :quantity, :integer
  end
end
