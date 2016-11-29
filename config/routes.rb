Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  get "/profile", to: "users#profile"
  resources :profile, only: [] do
    collection do
      resource :driver_details
    end
    member do
      resources :cars
    end
  end
  resources :room_categories
  resources :rooms do
    resources :travels
    resources :travel_requests
    member do
      get "/search", to: "rooms#search"
      post "/set_favourite", to: "rooms#set_favourite"
      post "/unset_favourite", to: "rooms#unset_favourite"
    end
  end

  namespace :admin do
    root "dashboard#index"
    resources :rooms
    resources :room_categories
  end

  namespace :api do
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: 'api/v1/devise_token_auth/registrations',
      sessions: 'api/v1/devise_token_auth/sessions',
      omniauth_callbacks:  'api/v1/devise_token_auth/omniauth_callbacks'
    }, skip: [:omniauth_callbacks]
    post "auth/facebook_login", to: "users/custom_omniauth_callbacks#omniauth_success"
  end
end
