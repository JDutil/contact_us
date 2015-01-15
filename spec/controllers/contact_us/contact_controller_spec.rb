require 'spec_helper'

describe ContactUs::ContactsController do

  describe 'create' do

    before do
      ContactUs.mailer_to = 'test@example.com'
    end

    it 'should redirect with success message if valid contact' do
      ContactUs.success_redirect = nil
      post :create, :contact_us_contact => { :email => 'test@test.com', :message => 'test' }
      expect(assigns(:contact).valid?).to eql(true)
      expect(flash[:notice]).to eql('Contact email was successfully sent.')
      expect(response).to redirect_to('/')
    end

    it 'should redirect to custom URL with success message if valid contact' do
      ContactUs.success_redirect = '/success'
      post :create, :contact_us_contact => { :email => 'test@test.com', :message => 'test' }
      expect(assigns(:contact).valid?).to eql(true)
      expect(flash[:notice]).to eql('Contact email was successfully sent.')
      expect(response).to redirect_to('/success')
      ContactUs.success_redirect = '/'
    end

    it 'should render new with error message if invalid contact' do
      post :create, :contact_us_contact => { :email => 'test@test.com', :message => '' }
      expect(assigns(:contact).valid?).to eql(false)
      expect(flash[:error]).to eql('You must enter both fields.')
      expect(response).to render_template('new')
    end

  end

  describe 'new' do

    it 'should assign contact for form and render page successfully' do
      get :new
      expect(assigns(:contact)).to be_an_instance_of(ContactUs::Contact)
      expect(response).to be_success
    end

  end

end
