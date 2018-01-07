Rails.application.routes.draw do
  root to: 'home#index'
  resources :players, only: [:create]
  resources :rooms, only: [:index]
end
