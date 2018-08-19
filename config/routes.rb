Rails.application.routes.draw do
  
    get 'follows/create'
    get 'posts/new'
    get 'posts/comment'
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
    
    root to: 'home#index'
    get 'home/index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
