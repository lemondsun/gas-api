class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.email[:user]
  layout 'mailer'
end
