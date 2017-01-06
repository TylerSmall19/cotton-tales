Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :categories, only: [:index, :show]

  # resources :categories do
  #   resources :articles
  # end
  get "/articles/:id/edit" => "revisions#new"
  resources :articles, except: :edit

  # get "categories/:id/articles" => "categories#show"
  resources :users, only: [:new, :create]

  root 'welcome#index'
  post '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy', as: 'logout'

  resources :articles do
    resources :revisions, only: [:index, :new, :create, :show]
  end
end
