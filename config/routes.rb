Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get "dashboard", to: "dashboards#show"

  resources :bids, only: [:index, :new, :create]

  root to: "home#index"
end
