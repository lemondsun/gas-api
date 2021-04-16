class SendNotificationsJob < ApplicationJob
  queue_as :default
  def perform(article)
     UserMailer.send_notification_mail(article).deliver_now
  end
end
