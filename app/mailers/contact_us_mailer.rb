class ContactUsMailer < ApplicationMailer
  def information_requested contact_name, contact_email, body
    @contact_name = contact_name
    @contact_email = contact_email
    @body = body
    mail subject: 'Consulta Las Gaviotas'
  end
end
