# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def send_notification_mail()
    
      UserMailer.send_notification_mail(User.new(email: 'lemondsun@gmail.com', telegram: '', price_id: 5))
  end
end
