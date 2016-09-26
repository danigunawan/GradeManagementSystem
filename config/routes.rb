Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  resources :subjects, except: [:index]
  resources :registrations, except: [:edit]
  resources :sections
  
  get '/registrations/:id/edit/:subject_id', to: 'registrations#edit', as: 'edit_registration'
  post '/registrations/section_list/:subject_id', to: 'registrations#section_list', as: 'section_list'
  get '/users/remove_account', to: 'users#remove_account', as: 'remove_account'  

  root to: 'sections#index', as: 'home'
end
