# == Route Map
#
#                   Prefix Verb   URI Pattern                                   Controller#Action
#                     root GET    /                                             artists#index
#            artist_albums GET    /artists/:artist_id/albums(.:format)          albums#index
#                          POST   /artists/:artist_id/albums(.:format)          albums#create
#         new_artist_album GET    /artists/:artist_id/albums/new(.:format)      albums#new
#        edit_artist_album GET    /artists/:artist_id/albums/:id/edit(.:format) albums#edit
#             artist_album GET    /artists/:artist_id/albums/:id(.:format)      albums#show
#                          PATCH  /artists/:artist_id/albums/:id(.:format)      albums#update
#                          PUT    /artists/:artist_id/albums/:id(.:format)      albums#update
#                          DELETE /artists/:artist_id/albums/:id(.:format)      albums#destroy
#                  artists GET    /artists(.:format)                            artists#index
#                          POST   /artists(.:format)                            artists#create
#               new_artist GET    /artists/new(.:format)                        artists#new
#              edit_artist GET    /artists/:id/edit(.:format)                   artists#edit
#                   artist GET    /artists/:id(.:format)                        artists#show
#                          PATCH  /artists/:id(.:format)                        artists#update
#                          PUT    /artists/:id(.:format)                        artists#update
#                          DELETE /artists/:id(.:format)                        artists#destroy
#         new_user_session GET    /users/sign_in(.:format)                      devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                      devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                     devise/sessions#destroy
#            user_password POST   /users/password(.:format)                     devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
#                          PATCH  /users/password(.:format)                     devise/passwords#update
#                          PUT    /users/password(.:format)                     devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
#        user_registration POST   /users(.:format)                              devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
#                          PATCH  /users(.:format)                              devise/registrations#update
#                          PUT    /users(.:format)                              devise/registrations#update
#                          DELETE /users(.:format)                              devise/registrations#destroy
#

Rails.application.routes.draw do
  # authenticated :user do
    root to: "artists#index"
  # end 

  
  resources :artists do
    resources :albums
  end

  resources :albums do
    resources :songs
  end
  
  devise_for :users

  # devise_scope :user do
  #   root to: "sessions#new"
  # end
end
