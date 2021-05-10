class WelcomeMailer < ApplicationMailer
  def send_welcome_email(user)
    # @user_price = Price.find(price_id).price
@gas_price = GasPrice.find(1).gas_price
    @user = user
    attachments.inline['logo.png'] = {
      data: File.read(Rails.root.join('app/assets/images/logo.png')),
      mime_type: 'image/png'
    }

    @url = 'localhost:3001.com'
    mail({
      to: user.email,
      from: 'eu@mauricioackermann.com.br',
      subject: 'Seja bem-vindo ao sistema Maurício Ackermann'
      })
  end
end
