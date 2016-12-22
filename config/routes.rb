Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  get "/progetto", to: 'home#progetto', as: 'progetto'
  get "/regolamento", to: 'home#regolamento', as: 'regolamento'
  get "/contatti", to: 'home#contatti', as: 'contatti'

  get "/profile", to: "users#profile"
  resource :profile, only: [] do
    collection do
      get "/edit", to: "users#edit"
      put "/update", to: "users#update"
      resource :driver_details
      resources :cars, except: [:show, :update]
    end
  end
  resources :notifications, only: [:index]
  resources :room_categories
  resources :rooms do
    resources :travels do
      member do
        post 'apply_user/:user_id', to: "travels#apply_user", as: "apply_user"
        post 'cancel_application/:user_id', to: "travels#cancel_application", as: "cancel_application"
        post 'approve_user/:user_id', to: "travels#approve_user", as: "approve_user"
        post 'cancel_approval/:user_id', to: "travels#cancel_approval", as: "cancel_approval"
        post '/mark_as_completed', to: "travels#mark_travel_as_completed"
      end
      resources :travel_reviews, only: [:update]
      resources :private_chats, only: [:create, :show]
    end
    resources :travel_requests
    member do
      get "/search", to: "rooms#search"
      post "/set_favourite", to: "rooms#set_favourite"
      post "/unset_favourite", to: "rooms#unset_favourite"
    end
  end

  resource :search

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

  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: 'api/devise_token_auth/registrations',
      sessions: 'api/devise_token_auth/sessions',
      omniauth_callbacks:  'api/devise_token_auth/omniauth_callbacks'
    }, skip: [:omniauth_callbacks]
    post "auth/facebook_login", to: "users/custom_omniauth_callbacks#omniauth_success"

    resources :room_categories, only: [:index, :show]
    resources :rooms, only: [:show] do
      post '/search', to: "rooms#search"
      post '/set_favourite', to: "rooms#set_favourite"
      post '/unset_favourite', to: "rooms#unset_favourite"
      collection do
        get '/latest_room', to: "rooms#latest_room"
        get 'search_rooms', to: "rooms#search_rooms"
      end
      resources :room_reviews, only: [:index, :create]
      resources :travel_requests do
        collection do
          get '/next_24_hours', to: "travel_requests#next_24_hours"
        end
        resources :travel_request_messages
      end
      resources :travels do
        post 'apply_user/:user_id', to: "travels#apply_user"
        post 'approve_user/:user_id', to: "travels#approve_user"
        post 'cancel_approval/:user_id', to: "travels#cancel_approval"
        post 'cancel_application/:user_id', to: "travels#cancel_application"
        collection do
          get '/next_24_hours', to: "travels#next_24_hours"
        end
        resources :public_messages, only: [:index, :create]
        resources :private_chats, only: [:create] do
          resources :private_messages, only: [:index, :create] do
          end
        end
      end
    end
    resources :users, only: [:show, :create, :update] do
      get '/preferred_rooms', to: "users#preferred_rooms"
      collection do
        get ':id/profile', to: "users#profile"
        # post ':id/sign_for_school/:school_code', to: "users#sign_for_school"
        post ':id/update_device_tokens', to: "users#update_device_tokens"
        post ':id/clear_device_tokens', to: "users#clear_device_tokens"
        post ':id/set_profile_image', to: "users#set_profile_image"
        get ':id/travels_count', to: "users#travels_count"
        get ':id/reviews_count', to: "users#reviews_count"
        get ':id/is_driver', to: "users#is_driver"
        get ':id/car_count', to: "users#car_count"
        get ':id/pending_driver_verification', to: "users#pending_driver_verification"
      end
      get 'travels_as_driver', to: "travels#travels_for_user_as_driver"
      get 'travels_as_applied', to: "travels#travels_for_user_as_applied"
      get 'travels_as_approved', to: "travels#travels_for_user_as_approved"
      get 'travels_as_passenger', to: "travels#travels_for_user_as_passenger"
      get 'travels/:id', to: "travels#show_travel_for_user"
      put 'travels/:travel_id/travel_reviews/:id', to: "travel_reviews#update"
      post 'travels/:id/mark_as_completed', to: "travels#mark_travel_as_completed"
      resources :travel_reviews, only: [:show] do
        collection do
          get 'as_target', to: 'travel_reviews#as_target'
          get 'as_target/latest', to: 'travel_reviews#latest_as_target'
          get 'as_author', to: 'travel_reviews#as_author'
        end
      end
      resources :driver_details
      resources :notifications do
        collection do
          get 'latest', to: "notifications#latest"
          get 'unclicked_count', to: "notifications#unclicked_count"
        end
        put 'set_clicked', to: "notifications#set_clicked"
      end
      resources :cars do
        collection do
          get '/slim', to: "cars#index_slim"
        end
      end
    end
  end
end
