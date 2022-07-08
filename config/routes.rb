Rails.application.routes.draw do
  root 'posts#index'
  resources :registrations, only: %i[new create]
  resources :logins, only: %i[new create destroy]
  resources :posts
  post '/logout', to: 'logins#destroy'
end
