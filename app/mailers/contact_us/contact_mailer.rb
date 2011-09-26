class ContactUs::ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @message = contact.message

    mail :from    => contact.email,
         :subject => t('contact_us.contact_mailer.contact_email.subject', :email => contact.email),
         :to      => ContactUs.mailer_to
  end
end
