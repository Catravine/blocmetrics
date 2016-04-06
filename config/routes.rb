Rails.application.routes.draw do

  # Users and profiles
  devise_for :users, :controllers => { registrations: 'registrations' }
  match 'users/:id' => 'users#show', :as => :profile, via: :get

  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'

end
