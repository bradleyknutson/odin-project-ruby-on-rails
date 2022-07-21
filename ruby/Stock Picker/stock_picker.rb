def stock_picker(stock_prices)
  best_price = 0
  days = []
  stock_prices.each_with_index do |buy, i|
    stock_prices.each_with_index do |sell, x|
      next if x <= i
      if sell - buy > best_price
        p sell - buy
        best_price = sell - buy
        days = [i,x]
      end
    end
  end
  days
end

p stock_picker([17,3,6,9,15,8,6,1,10])