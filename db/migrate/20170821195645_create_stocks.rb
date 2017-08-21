class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.integer :market_cap
      t.integer :stock_price

      t.timestamps
    end
  end
end
