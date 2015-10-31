Rails.application.routes.draw do
  # authenticated :user do
    root to: "artists#index"
  # end 

  resources :albums
  resources :artists
  
  devise_for :users

  # devise_scope :user do
  #   root to: "sessions#new"
  # end
end
