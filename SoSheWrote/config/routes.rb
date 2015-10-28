Rails.application.routes.draw do
  
  post 'sessions/create'

  post 'sessions/destroy'

  resources :tags
  resources :categories
  resources :articles do
    resources :comments
  end
  
  get "/login", to: 'sessions#new', as: "login"
  get "/bio", to: 'publics#bio', as: 'bio'
  get "/post/:id", to: 'posts#show', as: "post"
  get "/:category(/:tag)", to: 'posts#index', as: "posts"
  
  
  root 'publics#index'
end
