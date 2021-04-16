require 'test_helper'

class GasPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gas_price = gas_prices(:one)
  end

  test "should get index" do
    get gas_prices_url, as: :json
    assert_response :success
  end

  test "should create gas_price" do
    assert_difference('GasPrice.count') do
      post gas_prices_url, params: { gas_price: { gas_price: @gas_price.gas_price } }, as: :json
    end

    assert_response 201
  end

  test "should show gas_price" do
    get gas_price_url(@gas_price), as: :json
    assert_response :success
  end

  test "should update gas_price" do
    patch gas_price_url(@gas_price), params: { gas_price: { gas_price: @gas_price.gas_price } }, as: :json
    assert_response 200
  end

  test "should destroy gas_price" do
    assert_difference('GasPrice.count', -1) do
      delete gas_price_url(@gas_price), as: :json
    end

    assert_response 204
  end
end
