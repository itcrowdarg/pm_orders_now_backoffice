class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']
  default reply_to: ENV['MAIL_SENDER']
  layout 'mailer'

  def send_email(email, subject, body)
    mail(to: email, subject: subject, body: body).deliver
  end
end