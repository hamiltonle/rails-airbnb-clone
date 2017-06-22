Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users


  resources :users do
    collection do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :acts do
    collection do
      get 'good_for', to: "acts#good_for"
      get 'genre', to: "acts#genre"
    end

    resources :bookings, shallow: true

  end

  resources :bookings, only: [:index, :new, :create, :destroy]
  root to: "pages#home"
end






#                   Prefix Verb   URI Pattern                          Controller#Action
#         new_user_session GET    /users/sign_in(.:format)             devise/sessions#new
#             user_session POST   /users/sign_in(.:format)             devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)        devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)       devise/passwords#edit
#            user_password PATCH  /users/password(.:format)            devise/passwords#update
#                          PUT    /users/password(.:format)            devise/passwords#update
#                          POST   /users/password(.:format)            devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)              devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)             devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                devise/registrations#edit
#        user_registration PATCH  /users(.:format)                     devise/registrations#update
#                          PUT    /users(.:format)                     devise/registrations#update
#                          DELETE /users(.:format)                     devise/registrations#destroy
#                          POST   /users(.:format)                     devise/registrations#create
#            good_for_acts GET    /acts/good_for(.:format)             acts#good_for
#               genre_acts GET    /acts/genre(.:format)                acts#genre
#             act_bookings GET    /acts/:act_id/bookings(.:format)     bookings#index
#              act_booking GET    /acts/:act_id/bookings/:id(.:format) bookings#show
#                          PATCH  /acts/:act_id/bookings/:id(.:format) bookings#update
#                          PUT    /acts/:act_id/bookings/:id(.:format) bookings#update
#                     acts GET    /acts(.:format)                      acts#index
#                          POST   /acts(.:format)                      acts#create
#                  new_act GET    /acts/new(.:format)                  acts#new
#                 edit_act GET    /acts/:id/edit(.:format)             acts#edit
#                      act GET    /acts/:id(.:format)                  acts#show
#                          PATCH  /acts/:id(.:format)                  acts#update
#                          PUT    /acts/:id(.:format)                  acts#update
#                          DELETE /acts/:id(.:format)                  acts#destroy
#                 bookings GET    /bookings(.:format)                  bookings#index
#                          POST   /bookings(.:format)                  bookings#create
#              new_booking GET    /bookings/new(.:format)              bookings#new
#                  booking DELETE /bookings/:id(.:format)              bookings#destroy
#                     root GET    /                                    acts#index





  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/index'
  # get 'bookings/destroy'
  # get 'bookings/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

