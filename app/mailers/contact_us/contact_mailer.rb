class ContactUs::ContactMailer < ContactUs.parent_mailer.constantize
  def contact_email(contact)
    @contact = contact

    mail :from    => (ContactUs.mailer_from || @contact.email),
         :reply_to => @contact.email,
         :subject => (ContactUs.require_subject ? @contact.subject : t('contact_us.contact_mailer.contact_email.subject', :email => @contact.email)),
         :to      => ContactUs.mailer_to
  end
end
