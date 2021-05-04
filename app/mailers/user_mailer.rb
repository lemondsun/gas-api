class UserMailer < ApplicationMailer
  def send_notification_mail(price_id)
@user_price = Price.find(price_id).price
@gas_price = GasPrice.find(1).gas_price
attachments.inline['logo.png'] = {
  data: File.read(Rails.root.join('app/assets/images/logo.png')),
  mime_type: 'image/png'
}
attachments.inline['linkButton.jpg'] = {
  data: File.read(Rails.root.join('app/assets/images/linkButton.jpg')),
  mime_type: 'image/jpg'
}
@url = 'localhost:3001.com'
    mail(to: Price.find(price_id).users.pluck(:email), subject: 'Gas price alert')
end
end
