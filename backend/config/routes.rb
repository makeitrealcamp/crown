Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
    end
  end
  namespace :api do
    namespace :v1 do
      get "users/profile", to: "users#profile", as: "user_profile"
      resources :users, only: %i(create)

      resources :incidents, only: %i(create show index)
      resources :sessions,  only: %i(create)
    end
  end
end
