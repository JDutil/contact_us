class ContactUs::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new(:id=>1)
  end

  def create
    @contact = Contact.new(params[:contact_us_contact])
    
    if @contact.save    
      redirect_to('/', :notice => "Contact email was successfully sent.")
    else
      flash[:error] = "You must enter both fields."
      render :new
    end
  end
end
