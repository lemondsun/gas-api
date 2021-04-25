require File.expand_path("../config/environment", __dir__)
require 'telegram/bot'

token =  Rails.application.credentials.telegram[:token]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
   case message.text
   when '/start'
    bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} the current Ethereum Gas price is #{GasPrice.last.gas_price}")
   end
  end
end