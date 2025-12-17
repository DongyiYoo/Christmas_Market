module Discount
  # discount library with money rails

  def self.calculate(cart_items)
    subtotal = cart_items.sum { |item| item.price * item.quantity }
    total_quantity = cart_items.sum(&:quantity)

    discount_amount = Money.new(0, "EUR")
    discount_type = "No Discount"

    # buy 3+ 10% discount
    if total_quantity >= 3
      discount_amount = subtotal * 0.10
      discount_type = "Bulk Discount (10%)"
    end

    {
      subtotal: subtotal,
      discount_amount: discount_amount,
      final_total: subtotal - discount_amount,
      discount_type: discount_type
    }
  end
end
