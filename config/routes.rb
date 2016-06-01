Rails.application.routes.draw do
  
  resources :other_projects
  resources :ios_projects
  resources :rails_projects
  resources :contacts
  
  root 'pages#home'
  
  get '/rails-projects', to: 'rails_projects#index'
  get '/ios-projects', to: 'pages#ios_projects'

  get '/about', to: 'pages#about' 
  get '/blog', to: 'pages#blog' 
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :blogs do
    collection do

      post :javascript
      post :ruby_on_rails
      post :personal_development
      post :other
      
    end
  end
  
end
