Rails.application.routes.draw do
  resources :manufacturers, only: [:index, :create, :show, :new]
  resources :cars, only: [:index, :new, :create]
end
