Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    get 'login' => 'account#login'
    
    post 'login/authentication' => 'account#login_authentication'
    
    get 'logout' => 'account#logout'
    
    get 'dashboard' => 'dashboard#index'
    
    get 'register' => 'account#register_account'
    
    post 'register/create' => 'account#register_create_account'
    
    get 'register/role' => 'account#register_role_choice'
    
    get 'register/client' => 'account#register_role_client'
    
    get 'register/provider' => 'account#register_role_provider'
    
    get 'register/provider/establishment' => 'account#register_provider_establishment'
    
    get 'account' => 'account#edit'
    
    post 'account/update' => 'account#update'
    
    get 'establishments' => 'establishment#index'
    
    get 'establishments/new' => 'establishment#new'
    
    post 'establishments/create' => 'establishment#create'
    
    get 'establishments/:id' => 'establishment#show'
    
    post 'establishments/update/:id' => 'establishment#update'

    
    root 'application#index' 
  
end