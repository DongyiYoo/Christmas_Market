require "test_helper"

class MarketTest < ActiveSupport::TestCase
  test "should save valid market item" do
    market = Market.new(name: "Christmas Tree", price: 50.0, stock: 10)
    assert market.save, "Failed to save the valid market item"
  end

  test "should not save market without name" do
    market = Market.new(price: 10.0)
    assert_not market.save, "Saved the market without a name"
  end

  test "should not save market without price" do
    market = Market.new(name: "No Price Item")
    assert_not market.save, "Saved the market without a price"
  end
end
