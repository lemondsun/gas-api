class UserMailer < ApplicationMailer
  def send_notification_mail(article)
    
    mail(to: Price.find(article).users.pluck(:email), subject: 'Simple Demo to showcase Active Job')
end
end
