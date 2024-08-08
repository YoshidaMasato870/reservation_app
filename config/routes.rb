Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#top'
  get '/account', to: 'users#account'
  get '/profile', to: 'users#profile'
end
