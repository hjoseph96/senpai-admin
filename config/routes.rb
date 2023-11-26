Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get '/user_list' => 'admin/users#index', as: :user_list
  get '/users/:id' => 'admin/users#show', as: :user_show
  get '/user_map' => 'admin/users#view_map', as: :user_map
  get '/user_demographics' => 'admin/users#demographics'
  post '/users/:id/ban' => 'admin/users#ban_user',as: :ban_user
  post '/users/:id/warning' => 'admin/users#warn_user', as: :warn_user
end
