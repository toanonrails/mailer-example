## Simple example about ActionMailer

### Generate mailer:
```bash
rails generate mailer home welcome
```
will generate:  
- file `/app/mailers/home_mailer.rb`:
```ruby
class HomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.home_mailer.welcome.subject
  #
  def welcome
    mail to: "user@example.org", subject: "Welcome"
  end
end
```
- 2 views files:  
  - `/app/views/home_mailer/welcome.txt.erb`  
  - `/app/views/home_mailer/welcome.html.erb`
- a test file: `/test/mailers/home_mailer_test.rb`
- and a file use to preview mails content on browser: `/test/mailers/previews/home_mailer_preview.rb`

### Config
#### Sender's email:
Sender's email address can be configurated at `app/mailers/application_mailer.rb`
```ruby
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@sampleapp.com'
  layout 'mailer'
end
```
#### Development environment:
```ruby
# File /config/environments/development.rb

# Sent mails will be push on ActionMailer::Base.deliveries array
config.action_mailer.delivery_method = :test

host = "localhost:3000"
config.action_mailer.default_url_options = {host: host, protocol: "http"}
``` 
### How to send an mail:
```ruby
HomeMailer.welcome.delivery_now
```
### Config to Use Gmail to send mail in production
```ruby
# File /config/environments/production.rb

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 587,
  domain:               "example.com",
  user_name:            ENV["GMAIL"],
  password:             ENV["GMAIL_PASSWORD"],
  authentication:       "plain",
  enable_starttls_auto: true
}
```
Note: As of July 15, 2014, Google increased its security measures and now blocks attempts from apps it deems less secure. You can change your gmail settings [here](https://www.google.com/settings/security/lesssecureapps) to allow the attempts.  
If your Gmail account has 2-factor authentication enabled, then you will need to set an [app password](https://myaccount.google.com/apppasswords) and use that instead of your regular password.
