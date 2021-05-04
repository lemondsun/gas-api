class WelcomeMailer < ApplicationMailer
  def send_welcome_email(user)
    @user = user
    attachments.inline['logo.png'] = {
      data: File.read(Rails.root.join('app/assets/images/logo.png')),
      mime_type: 'image/png'
    }
    attachments.inline['linkButton.jpg'] = {
      data: File.read(Rails.root.join('app/assets/images/linkButton.jpg')),
      mime_type: 'image/jpg'
    }
    @url = 'localhost:3001.com'
    mail({
      to: user.email,
      from: 'eu@mauricioackermann.com.br',
      subject: 'Seja bem-vindo ao sistema Maurício Ackermann'
      })
  end
end
