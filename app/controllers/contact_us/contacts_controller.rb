class ContactUs::ContactsController < ApplicationController

  def create
    @contact = ContactUs::Contact.new(params[:contact_us_contact])

    if @contact.save
      redirect_to('/', :notice => t('contact_us.notices.success'))
    else
      flash[:error] = t('contact_us.notices.error')
      render_new_page
    end
  end

  def new
    @contact = ContactUs::Contact.new
    render_new_page
  end

  protected

    def render_new_page
      case ContactUs.form_gem
      when 'formtastic'  then render 'new_formtastic'
      when 'simple_form' then render 'new_simple_form'
      else
        render 'new'
      end
    end

end
