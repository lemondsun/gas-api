class SendNotificationsJob < ApplicationJob
  queue_as :default
  def perform(price_id)
     UserMailer.send_notification_mail(price_id).deliver_now
  end
end
