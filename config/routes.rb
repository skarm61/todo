RailsApplication2::Application.routes.draw do
  

  resources :lists do
    resources :tasks do
      post 'done'
      post 'not_done'
    end
  end

  resources :news
   
  resources :users do
    post 'add_vk_acc'
  end
  #resources :lists
  
  resources :sessions, :only => [:new, :create, :destroy]
  #resources :tasks#, :only => [:create, :destroy]
  resources :emails
  

  match '/signup',  :to => 'users#new_user'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/create',  :to=> 'users#create', :as => :create_user
  
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  root :to => 'pages#home'
    
  get "users/new"
  get "users/create/email"
  get 'callback'  => 'users#callback'
  
  #get 'show_list' =>'lists#show', :as =>:list  

end