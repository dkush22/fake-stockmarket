class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :type_of_account
      t.integer :total_money, default: 0
      t.integer :in_app_account_id
      t.integer :user_id

      t.timestamps
    end
  end
end
