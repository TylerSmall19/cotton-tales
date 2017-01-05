Rails.application.routes.draw do
  resources :articles
  get "categories/:id/articles" => "categories#show"
  resources :users, only: [:new]

  resources :categories, only: [:index, :show]

  # resources :categories do
  #   resources :articles
  # end

  resources :users, only: [:new, :create]

  root 'welcome#index'
  post '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy', as: 'logout'

end
