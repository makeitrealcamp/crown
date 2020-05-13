Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, param: "username", only: %i(create show)
      resources :incidents, only: %i(create show index)
      resources :sessions,  only: %i(create)
    end
  end
end
