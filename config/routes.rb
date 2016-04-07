Rails.application.routes.draw do
  
  resources :blogs
  resources :rails_projects
  root 'pages#home'
  
  get '/rails-projects', to: 'rails_projects#index'
  get '/ios-projects/show', to: 'rails_projects#index'
  get '/ios-projects', to: 'pages#ios_projects'

  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
end
