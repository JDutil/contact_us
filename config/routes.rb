Rails.application.routes.draw do
  # If the I18n gem is installed then place the contact_us routes within the optional locale scope
  if defined?(I18n) and ContactUs.localize_routes
    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      resources :contacts,
                :controller => 'contact_us/contacts',
                :only       => [:new, :create]
      get 'contact-us' => 'contact_us/contacts#new', :as => :contact_us
    end
    
  else
    resources :contacts,
              :controller => 'contact_us/contacts',
              :only       => [:new, :create]
    get 'contact-us' => 'contact_us/contacts#new', :as => :contact_us
  end
end
