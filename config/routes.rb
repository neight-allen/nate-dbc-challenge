Rails.application.routes.draw do
  resources :artists
  root to: "artists#index"
  devise_for :users#, :controllers => { :registrations => 'devise/registrations', :sessions => 'sessions', :passwords => 'passwords'}
end
