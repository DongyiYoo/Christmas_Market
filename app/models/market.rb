class Market < ApplicationRecord
  def stock_current
    return "Out of stock" if stock.to_i <= 0
    "In stock"
  end

validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
