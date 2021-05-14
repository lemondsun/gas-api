class SendNotificationsJob < ApplicationJob
  queue_as :default
  def perform(price_id)
     UserMailer.send_notification_mail(price_id).deliver_later(wait: 1.second)
     sleep 1
  end
end
