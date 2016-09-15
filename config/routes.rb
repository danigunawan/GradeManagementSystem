Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :subjects
  resources :registrations
  resources :roles
  
  root to: 'subjects#index', as: 'home'
end
