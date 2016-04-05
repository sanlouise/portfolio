Rails.application.routes.draw do
  
  resources :blogs
  resources :rails_projects
  root 'pages#home'
  
  get '/rails-projects', to: 'rails_projects#index'
  get '/portfolio2', to: 'pages#portfolio2'
  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  get '/contact', to: 'pages#contact' 
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  

  
end
