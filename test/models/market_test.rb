require "test_helper"

class MarketTest < ActiveSupport::TestCase
  test "should save valid market item" do
    market = Market.new(name: "Christmas Tree", price: 50.0, stock: 10, description: "Tree", image_url: "http://test.com/img.jpg")
    assert market.save, "Failed to save the valid market item"
  end

  test "should not save market without name" do
    market = Market.new(price: 10.0, stock: 5)
    assert_not market.save, "Saved the market without a name"
  end

  test "should not save market without price" do
    market = Market.new(name: "No Price Item", stock: 5)
    assert_not market.save, "Saved the market without a price"
  end

  test "should not save market with negative price" do
    market = Market.new(name: "Negative Price", price: -5.0, stock: 5)
    assert_not market.save, "Saved the market with negative price"
  end
end
