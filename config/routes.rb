Rails.application.routes.draw do

  resources :articles

  get "categories/:id/articles" => "categories#show"

  get "/articles/:id/edit" => "revisions#new"

  resources :users, only: [:new, :create]

  mount Ckeditor::Engine => '/ckeditor'
  resources :categories, only: [:index, :show]
  # resources :categories do
  #   resources :articles
  # end
  resources :articles, except: :edit

  root 'welcome#index'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy', as: 'logout'

  resources :articles do
    resources :revisions, only: [:index, :new, :create, :show]
  end
end
