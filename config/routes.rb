Rails.application.routes.draw do
  
  # Pages
  root 'pages#home'
  get '/about', to: 'pages#about' 

  # Contact
  resources :contacts, only: [:new, :create]
  
  # User Auth
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'

  # Projects
  get '/projects', to: 'projects#index'
  get '/javascript-projects', to: 'projects#javascript'
  get '/ruby-on-rails-projects', to: 'projects#rails'
  get '/ios-projects', to: 'projects#ios'
  
  # Blogs
  resources :blogs, only: [:index]  
  resource :pages do
    collection do
      post :search, to: 'pages#search'
    end
  end
  
end
