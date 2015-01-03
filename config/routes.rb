Rails.application.routes.draw do
  root 'cars#index'
  resources :manufacturers, only: [:index, :create, :new]
  resources :cars, only: [:index, :new, :create]
end
