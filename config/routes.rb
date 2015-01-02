Rails.application.routes.draw do
  resources :manufacturers, only: [:index, :create, :show, :new]
end
