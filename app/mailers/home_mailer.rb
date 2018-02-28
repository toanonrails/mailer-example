class HomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.home_mailer.welcome.subject
  #
  def welcome
    mail to: "user@example.org", subject: "Welcome aboard!"
  end
end
