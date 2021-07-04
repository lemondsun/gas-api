require File.expand_path("../config/environment", __dir__)
require 'telegram/bot'


token =  Rails.application.credentials.telegram[:token]



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

      # @result = bot.api.send_message(chat_id: message.chat.id, reply_to_message_id: message.message_id, text: "Hello, #{message.from.first_name}")['result']

    #  bot.api.send_message(chat_id: message.chat.id, text: question,  )['chat']
    #   @replyMessage = bot.api.copyMessage(from_chat_id: "#{@result["username"]}")
     @replyMessage = bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers  )['result']

     @userResponse = message
     byebug
    #  @userResponse = bot.update(chat_id: message.chat.id,)
    # @userResponse = bot.send(:log_incoming_message, message.chat.id)
    # (chat_id: message.chat.id, from_chat_id: message.chat.id, message_id: @replyMessage["message_id"] )
    chats = Telebot.all
    
    chats.each {
      |chat| if message.chat.id === chat.chatId
      
      # @price = @replyMessage["message_id"]
      i = chat
      i.update_attribute(:price, @userResponse)
      i.save
    #   i = Telebot.new
    # i.chatId = message.chat.id
    # # i.price = @price
    # i.price = message.text.from(@result["username"])
    # i.save 
   end
    }

  end
  end
  end

