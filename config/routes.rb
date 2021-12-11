Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'snippets#index'

  resources :snippets, only: %i[new create index show]
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
end
