class ApplicationMailer < ActionMailer::Base
  default from: "contacto@gaviotas.com"
  default to: "fernando.di.bartolo@gmail.com, contacto.vuelagaviota@gmail.com"
  layout 'mailer'
end
