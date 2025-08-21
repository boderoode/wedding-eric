Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Admin dashboard route
  get "admin", to: "admin#dashboard", as: :admin_dashboard

  # Admin RSVP management routes
  namespace :admin do
    resources :rsvps
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  resources "rsvps" do
  end

  resources "gifts" do
  end

  resources "faq" do
  end

  resources "hotels" do
  end

  # Defines the root path route ("/")
  root "home#index"
end
