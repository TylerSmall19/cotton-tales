Rails.application.routes.draw do
  resources :articles
  resources :users, only: [:new, :create]

  get "categories/:id/articles" => "categories#show"

  resources :categories, only: [:index, :show]

  # resources :categories do
  #   resources :articles
  # end

  root 'welcome#index'
  post '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy', as: 'logout'

end
