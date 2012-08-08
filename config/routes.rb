RailsApplication2::Application.routes.draw do
  resources :users  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tasks, :only => [:create, :destroy]
  resources :emails

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  root :to => 'pages#home'
  
  get "users/new"


end