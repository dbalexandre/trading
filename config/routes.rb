Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get "dashboard", to: "dashboards#show"

  resources :bids, only: [:index, :new, :create] do
    get :available, on: :collection

    resources :orders, only: [:new, :create]
  end

  root to: "home#index"
end
