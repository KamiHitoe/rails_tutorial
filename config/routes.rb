Rails.application.routes.draw do
  get 'users/new'
  # どのcontroller, templateをレンダリングするか選択
  
  root 'static_pages#home'
  get '/help', to: 'static_pages#help' # = help_path
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # /users/n
  resources :users
end

