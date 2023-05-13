Rails.application.routes.draw do
  resources :products
  root "orders#new"

  resources :orders, only: [:new, :create]
end
