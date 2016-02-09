Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/portfolio', to: 'pages#portfolio'
  get '/portfolio2', to: 'pages#portfolio2'
  get '/portfolio3', to: 'pages#portfolio3'
  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  get '/contact', to: 'pages#contact' 
  
end
