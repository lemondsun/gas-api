require File.expand_path("../config/environment", __dir__)
require 'telegram/bot'


token =  Rails.application.credentials.telegram[:token]
@users = User.all


Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
   case message.text
   when '/start'
    bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, the current Ethereum Gas price is #{GasPrice.find(1).gas_price}")
    i = Telebot.new
    i.chatId = message.chat.id
    i.save 
   when '/set_price'

    question = "Hello #{message.from.first_name}, tell me a price and I will alert you when the Ethereum Gas price is at or below your target price."

    answers =
      Telegram::Bot::Types::ReplyKeyboardMarkup
      .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)

    bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: markup)
  #   save_context :price
  #   # price = gets
  #   chats = Telebot.all
  #   chats.each {
  #     |chat| if message.chat.id === chat.chatId
  #     i = Telebot.find(chat.id)
  #     i.update_attribute(:price, price)
  #     i.save
  #  end
    # }

  end
  end
  end

