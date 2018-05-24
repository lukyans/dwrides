Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  # resources :home, only: [:index]
  root to: "home#index"

  resources :drives, only: [:index, :create] do
    collection do
      get :requested
      get :available
    end
  end
  resources :rides, only: [:index, :create] do
    collection do
      get :requested
      get :offered
    end
  end

  resources :courses, only: [:index, :create]
end
