Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get "dashboard", to: "dashboards#show"

  resources :bids, only: [:index, :new, :create] do
    get :available, on: :collection

    resources :messages, only: [:create]
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:index]

  namespace :admin do
    resources :bids, only: [:index]
    resources :orders, only: [:index]
    resources :users, only: [:index]
  end

  root to: "home#index"
end
