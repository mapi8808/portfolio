class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: 'mapi.008.k@gmail.com', subject: 'お問い合わせ内容'
  end
end
