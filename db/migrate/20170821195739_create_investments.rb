class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :amount

      t.timestamps
    end
  end
end
