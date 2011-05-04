class ContactUs::ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @message = contact.message

    mail :from    => contact.email,
         :subject => "Contact Us message from #{contact.email}",
         :to      => ContactUs.mailer_to
  end
end
