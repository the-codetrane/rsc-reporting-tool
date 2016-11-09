class WelcomeMailer < ApplicationMailer
  default from: 'no-reply@naworks.com'
  default subject: I18n.t('welcome_mailer.welcome.subject')
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.welcome_email.subject
  #
  def welcome
    @greeting = 'Hi from the mailer!'

    mail to: 'michael.m.cain.ii@gmail.com'
  end
end
