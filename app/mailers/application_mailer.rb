class ApplicationMailer < ActionMailer::Base
  default from: "contact@gaviotas.com"
  default to: "fernando.di.bartolo@gmail.com"
  layout 'mailer'
end
