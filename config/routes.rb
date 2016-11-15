Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :room_categories
  resources :rooms do
    resources :travel_requests
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
