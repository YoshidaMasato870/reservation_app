Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#top'
  get '/account', to: 'users#account'
  get '/profile', to: 'users#profile'
  get '/profile/edit', to: 'users#edit'
  patch '/profile/update', to: 'users#update'
  get '/reserved', to: 'reservations#reserved'
  resources :rooms
  resources :reservations do
    collection do
      post :confirm
      post :confirm_change
      get :reserved
    end
  end
end
