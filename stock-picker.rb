def stock_picker(stock_prices)
  max = stock_prices.max
  min = stock_prices.min
  best_days = []
  profits = {}

  
  stock_prices.each do |price|
    stock_prices.each do |next_price|
      if price > next_price && stock_prices.index(price) > stock_prices.index(next_price)
        profits["#{price} - #{next_price}"] = price - next_price
      end
    end
  end
  max_min_array = profits.max_by{|prices, profit| profit}[0].split(" ")
  best_days.push(max_min_array[2].to_i).push(max_min_array[0].to_i)
  p best_days
end

stock_picker([17,3,6,9,15,8,6,11,10])