Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root to: "home#index"

  resources :drives do
    member do
      get :requested
      get :reserve
      get :cancel
    end
  end

  resources :rides do
    member do
      get :available
      get :reserved
    end
  end

  resources :home, only: [:index] do
    collection do
      get :about
    end
  end

  resources :events
end
