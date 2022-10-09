class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    
    mail to: @contact.email, subject: "記事を投稿しました"
  end
end