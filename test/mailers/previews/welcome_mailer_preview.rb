# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def send_welcome_email
    WelcomeMailer.send_welcome_email(User.new(email: 'lemondsun@gmail.com', telegram: '', price_id: 5))
  end

end
