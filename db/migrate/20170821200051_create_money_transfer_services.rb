class CreateMoneyTransferServices < ActiveRecord::Migration[5.1]
  def change
    create_table :money_transfer_services do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :amount

      t.timestamps
    end
  end
end
