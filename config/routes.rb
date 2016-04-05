Rails.application.routes.draw do
  
  resources :blogs
  resources :rails_projects
  root 'pages#home'
  
  get '/rails-projects', to: 'rails_projects#index'
  get '/portfolio2', to: 'pages#portfolio2'
  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  get '/contact', to: 'pages#contact' 

  
end
