Rails.application.routes.draw do
  
  root 'static_pages#home'
  # named route
  get '/help', to: 'static_pages#help' # = help_path
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # /users/n
  resources :users
  
  # get 'users/new'
end

