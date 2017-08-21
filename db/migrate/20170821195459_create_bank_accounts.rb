class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :type_of_account
      t.integer :total_money

      t.timestamps
    end
  end
end
