class ApplicationMailer < ActionMailer::Base
  default from: "Test@email.com"
  layout "mailer"
end
