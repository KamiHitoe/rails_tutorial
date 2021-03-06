Rails.application.routes.draw do
  
  root 'static_pages#home'
  # HTTP protocol '/path', to: 'controller#action'
  get '/help', to: 'static_pages#help' # = help_path
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # /users/n
  resources :users

end

