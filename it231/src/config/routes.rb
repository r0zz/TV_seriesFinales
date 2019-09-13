Rails.application.routes.draw do
  root :to =>'home#home'

  get 'sortby/srs'

  get 'sortby/vws'

  get 'sortby/hhr'

  get 'sortby/net'

  resources :finale_ratings
  resources :myusers
  resources :users
  
  get 'home/home'

  get 'home/dataset'
  post 'home/dataset'

  get 'home/browse'
  post 'home/browse'

  get 'home/search'
  post 'home/search'

  get 'home/login'
  post 'home/login'

  get 'home/logout'
  post 'home/logout'

  get 'home/newuser'
  post 'home/newuser'

  get 'home/user'
  post 'home/user'
  
  get 'home/saveList'
  post 'home/saveList'

  get 'home/removeItems'
  post 'home/removeItems'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
