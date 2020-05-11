Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, param: "username", only: %i(create show)
      resources :incidents, only: %i(create show index)

      post '/auth/login', to: 'authentication#login'
    end
  end
end
