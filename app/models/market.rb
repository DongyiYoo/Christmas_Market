class Market < ApplicationRecord
  def stock_current
    return "Out of stock" if stock.to_i <= 0
    "In stock"
  end
end
