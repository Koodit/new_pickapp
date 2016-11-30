Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  get "/profile", to: "users#profile"
  resource :profile, only: [] do
    collection do
      get "/edit", to: "users#edit"
      put "/update", to: "users#update"
      resource :driver_details
      resources :cars, except: [:show, :edit, :update]
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
    resources :pending_driver_verifications do
      member do
        put "/become_driver", to: "pending_driver_verifications#become_driver", as: "become_driver"
        put "/deny_driver", to: "pending_driver_verifications#deny_driver", as: "deny_driver"
      end
    end
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
