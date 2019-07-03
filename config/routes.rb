Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
 # get '/post', to: 'posts#new'
 # post '/post', to: 'posts#create'
  get '/tags/new', to: 'tags#new'
  post '/tags/new', to: 'tags#create'
  resources :posts do
    get '/addtag', to: 'tags#newbind'
    post '/addtag', to: 'tags#createbind'
    delete '/tag', to: 'tags#destroybind'
    resources :comments
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
