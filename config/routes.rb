Rails.application.routes.draw do
  devise_for :users

  # resources :home, only: [:index]
  root to: "home#index"

  resources :rides, only: [:index, :create] do
    collection do
      get :requested
      get :available
    end
  end
  resources :drives, only: [:index, :create] do
    collection do
      get :offered
      get :needed
    end
  end
end
