require "test_helper"

class MarketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market = markets(:one)
  end

  test "should get index" do
    get markets_url, as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_not_empty json_response
  end

  test "should create market" do
    assert_difference("Market.count") do
      post markets_url, params: { market: { description: @market.description, name: @market.name, price: @market.price, stock: @market.stock } }, as: :json
    end

    assert_response :created
  end

  test "should show market" do
    get market_url(@market), as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @market.name, json_response["name"]
  end

  test "should update market" do
    patch market_url(@market), params: { market: { description: @market.description, name: @market.name, price: @market.price, stock: @market.stock } }, as: :json
    assert_response :success
  end

  test "should destroy market" do
    assert_difference("Market.count", -1) do
      delete market_url(@market), as: :json
    end

    assert_response :no_content
  end
end
