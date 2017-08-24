require 'csv'
csv_text = File.path(Rails.root.join('db', 'csv_files', 'stocks.csv'))

CSV.foreach(csv_text) do |row|
    Stock.create(name: row[1], ticker: row[0], market_cap: 1000000, stock_price: row[2].to_i.round)
end