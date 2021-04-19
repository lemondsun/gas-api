class UserMailer < ApplicationMailer
  def send_notification_mail(price_id)
@user_price = Price.find(price_id).price
    mail(to: Price.find(price_id).users.pluck(:email), subject: 'Gas price alert')
end
end
