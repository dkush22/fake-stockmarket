class CreateInAppAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :in_app_accounts do |t|
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
