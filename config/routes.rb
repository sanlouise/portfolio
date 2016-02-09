Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/portfolio', to: 'pages#portfolio'
  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  get '/contact', to: 'pages#contact' 
  
end
