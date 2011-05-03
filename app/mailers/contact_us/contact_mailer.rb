class ContactUs::ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @message = contact.message
    
    mail(:to => "contact@YOUR-SITE.com",
         :subject => "Contact Us message from #{contact.email}",
         :from => contact.email)
  end
end
