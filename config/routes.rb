RailsApplication2::Application.routes.draw do
  resources :users  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tasks, :only => [:create, :destroy]
  resources :emails
  

  match '/signup',  :to => 'users#new_test'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/create',  :to=> 'users#create', :as => :create_user

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  root :to => 'pages#home'
    
  get "users/new"
  get "users/create/email"


end