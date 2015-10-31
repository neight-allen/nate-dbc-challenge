Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users, path: '', :controllers => { :registrations => 'registrations', :sessions => 'sessions', :passwords => 'passwords'}
end
