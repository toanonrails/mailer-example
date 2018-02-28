class HomeController < ApplicationController
  def send_welcome_email
    HomeMailer.welcome.deliver_now
  end
end
