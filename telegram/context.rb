class Telegram::WebhookController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def rename(*)
    # set context for the next message
    save_context :rename
    respond_with :message, text: 'What name do you like?'
  end
  # register context handlers to handle this context
  context_handler :rename do |*words|
    update_name words[0]
    respond_with :message, text: 'Renamed!'
  end

  context_handler :rename
  context_to_action!
end