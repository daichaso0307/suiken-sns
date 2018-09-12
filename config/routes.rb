Rails.application.routes.draw do
    
    get "login" => "users#login_form"
    post "login" => "users#login"
    post "logout" => "users#logout"
    
    get "signup" => "users#new"

    post "users/:id/update" => "users#update"
    get "users/:id/edit" => "users#edit"
    post "users/create" => "users#create"
    get "users/:id/delete" => "users#destroy"
    get "users/index" => "users#index"
    get "users/:id" => "users#show"
    
    get "posts/index" => "posts#index"
    get "posts/new" => "posts#new"
    get "posts/:id" => "posts#show"
    post "posts/create" => "posts#create"
    get "posts/:id/edit" => "posts#edit"
    post "posts/:id/update" => "posts#update"
    post "posts/:id/destroy" => "posts#destroy"
    
    resources :users
  
  
  
    get 'follows/create'
    get 'posts/new'
    post 'posts/:post_id/comments' => 'comments#create'
    post 'posts/:post_id/comments/new' => 'comments#new'
    resources :posts
  
    get 'users/new'
    get 'users/logout'
    get 'users/login'
    post 'users/send_login'
  
    resources :follows
  
    resources :posts do
        resources :comments
    end
    
    post 'favorites/index'
    post '/favorites', to: 'favorites#create'
    
    root to: 'home#index'
    get 'home/index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
