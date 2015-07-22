Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get "dashboard", to: "dashboards#show"

  resources :bids, only: [:new, :create] do
    get :available, on: :collection
  end

  root to: "home#index"
end
