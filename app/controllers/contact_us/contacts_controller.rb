class ContactUs::ContactsController < ApplicationController
  
  def new
    @contact = ContactUs::Contact.new(:id=>1)
  end

  def create
    @contact = ContactUs::Contact.new(params[:contact_us_contact])
    
    if @contact.save    
      redirect_to('/', :notice => t('contact_us.notices.success'))
    else
      flash[:error] = t('contact_us.notices.error')
      render :new
    end
  end
end
