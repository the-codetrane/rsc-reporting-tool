class WelcomeMailer < ApplicationMailer
  default from: 'no-reply@naworks.com'
  default subject: I18n.t('welcome_mailer.welcome.subject')

  def welcome(user)
    @user = user
    @greeting = "Hi, #{@user.first_name}!"

    mail to: 'michael.m.cain.ii@gmail.com'
  end
end
