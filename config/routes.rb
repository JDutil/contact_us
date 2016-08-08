Rails.application.routes.draw do
  # Place the contact_us routes within the optional locale scope
  # If the I18n gem is installed and the localize_routes variable has
  # been set to true in the application's initializer file
  if defined?(I18n) && ContactUs.localize_routes
    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      resources :contacts,
                controller: "contact_us/contacts",
                only:       [:new, :create]

      get "contact-us" => "contact_us/contacts#new", as: :contact_us
    end

  else
    resources :contacts,
              controller: "contact_us/contacts",
              only:       [:new, :create]

    get "contact-us" => "contact_us/contacts#new", as: :contact_us
  end
end
