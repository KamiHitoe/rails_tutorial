Rails.application.routes.draw do
  # どのcontroller, templateをレンダリングするか選択
  
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
end
