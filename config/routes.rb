Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :purchases, only: [:index, :create]
    resources :messages, only: [:create]
  end
end
