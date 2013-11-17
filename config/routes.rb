PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create]
  end

  resources :categories, only: [:show, :new, :create]
  resources :users, except: [:new, :index, :destroy]

end
