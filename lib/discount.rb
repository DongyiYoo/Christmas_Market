module Discount
  # discount library with money rails

  def self.calculate(cart_items)
    items = cart_items || []

    subtotal = items.sum do |item|
      price = Money.from_amount(item["price"].to_f, "EUR")
      price * item["quantity"].to_i
    end

    total_quantity = items.sum { |item| item["quantity"].to_i }

    discount_amount = Money.new(0, "EUR")
    discount_type = "No Discount"

    # buy 3+ 10% discount
    if total_quantity >= 3
      discount_amount = subtotal * 0.10
      discount_type = "Bulk Discount (10%)"
    end

    final_total = subtotal - discount_amount

    {
      subtotal: subtotal.to_f,
      discountAmount: discount_amount.to_f,
      finalTotal: final_total.to_f,
      discountType: discount_type
    }
  end
end
