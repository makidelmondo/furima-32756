Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :deal_records, only: [:index, :new, :create]
  end
end
