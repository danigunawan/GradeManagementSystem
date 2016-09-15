Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  resources :subjects
  resources :registrations, except: [:edit]
  resources :roles
  resources :sections
  
  get '/registrations/:id/edit/:subject_id', to: 'registrations#edit', as: 'edit_registration'
  post '/registrations/section_list/:subject_id', to: 'registrations#section_list', as: 'section_list'
  
  
  root to: 'subjects#index', as: 'home'
end
