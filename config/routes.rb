Rails.application.routes.draw do
  controller 'contact_us/contacts' do
    get 'contact-us' => :new
    post :create
  end
end
