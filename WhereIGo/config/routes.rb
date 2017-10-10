Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    get 'login' => 'sessions#new'
    
    get 'login/error' => 'sessions#error'
    
    post 'login/auth' => 'sessions#create'
    
    get 'dashboard' => 'dashboard#index'
    
    get 'register' => 'register#new'
    
    get 'register/client' => 'register#new_client'
    
    post 'register/create' => 'register#create'
    
    get 'register/provider' => 'register#new_provider'
    
    get 'register/establishment' => 'register#new_establishment'
    
    post 'register/establishment/create' => 'register#create_establishment'
    
    get 'register/error' => 'register#error'
    
    get 'account' => 'account#edit'
    
    post 'account/update' => 'account#update'
    
    get '/logout' => 'sessions#destroy'
    
    root 'sessions#new' 
  
end
