require 'test_helper'

class TelebotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telebot = telebots(:one)
  end

  test "should get index" do
    get telebots_url, as: :json
    assert_response :success
  end

  test "should create telebot" do
    assert_difference('Telebot.count') do
      post telebots_url, params: { telebot: { chatId: @telebot.chatId, price: @telebot.price } }, as: :json
    end

    assert_response 201
  end

  test "should show telebot" do
    get telebot_url(@telebot), as: :json
    assert_response :success
  end

  test "should update telebot" do
    patch telebot_url(@telebot), params: { telebot: { chatId: @telebot.chatId, price: @telebot.price } }, as: :json
    assert_response 200
  end

  test "should destroy telebot" do
    assert_difference('Telebot.count', -1) do
      delete telebot_url(@telebot), as: :json
    end

    assert_response 204
  end
end
