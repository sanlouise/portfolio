Rails.application.routes.draw do
  
  resources :projects
  resources :contacts
  
  root 'pages#home'

  get '/about', to: 'pages#about' 
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  
  resource :pages do
    collection do
      post :search, to: 'pages#search'
    end
  end
  
end
