require 'csv'



stocks_path = '/Users/flatironschool/Development/Two-Module/rails/fake-stockmarket/db/csv_files/stocks.csv'

CSV.foreach(stocks_path) do |row|
	Stock.create(name: row[1], ticker: row[0], market_cap: 1000000, stock_price: row[2].to_i.round)
end