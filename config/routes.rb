Rails.application.routes.draw do
  resources :categories
  resources :articles
  # get "categories/:id/articles" => "categories#show"
  resources :users, only: [:new]

  root 'welcome#index'
  post '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy', as: 'logout'

end
