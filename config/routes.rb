Rails.application.routes.draw do
  devise_for :users

  resources :acts do

    collection do
      get 'good_for', to: "acts#good_for"
      get 'genre', to: "acts#genre"
    end

    resources :bookings, only: [:index, :show, :update]
  end

  resources :bookings, only: [:index, :new, :create, :destroy]

  root to: "acts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
