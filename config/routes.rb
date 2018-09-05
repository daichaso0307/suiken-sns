Rails.application.routes.draw do
  
    get 'follows/create'
    get 'posts/new'
    post 'posts/:post_id/comments' => 'comments#create'
    post 'posts/:post_id/comments/new' => 'comments#new'
    resources :posts
  
    get 'users/new'
    get 'users/logout'
    get 'users/login'
    post 'users/send_login'
    resources :users
  
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
