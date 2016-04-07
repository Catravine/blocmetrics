Rails.application.routes.draw do

  # Users and profiles
  devise_for :users, :controllers => { registrations: 'registrations' }
  match 'users/:id' => 'users#show', :as => :profile, via: :get

  # Registered Applications
  resources :registered_applications

  # Home and About pages
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
