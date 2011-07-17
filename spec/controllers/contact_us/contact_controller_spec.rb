require 'spec_helper'

describe ContactUs::ContactsController do

  describe 'create' do

    it 'should redirect with success message if valid contact' do
      post :create, :contact_us_contact => { :email => 'test@test.com', :message => 'test' }
      assigns(:contact).valid?.should eql(true)
      flash[:notice].should eql('Contact email was successfully sent.')
      response.should redirect_to('/')
    end

    it 'should render new with error message if invalid contact' do
      post :create, :contact_us_contact => { :email => 'test@test.com', :message => '' }
      assigns(:contact).valid?.should eql(false)
      flash[:error].should eql('You must enter both fields.')
      response.should render_template('new')
    end

  end

  describe 'new' do

    it 'should assign contact for form and render page successfully' do
      get :new
      assigns(:contact).should be_an_instance_of(ContactUs::Contact)
      response.should be_success
    end

  end

end
