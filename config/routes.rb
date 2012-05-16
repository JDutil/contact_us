Rails.application.routes.draw do
  resources :contacts,
    :controller => 'contact_us/contacts',
    :only       => [:new, :create]
  match 'contact-us' => 'contact_us/contacts#new', :as => :contact_us
end
