Rails.application.routes.draw do
  resources :users, only: [:new]

  root 'welcome#index'


end
