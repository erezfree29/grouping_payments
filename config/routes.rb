Rails.application.routes.draw do
  devise_for :users
 root to: 'users#home'
 resources :users do 
  # external entites
  get 'external_entities', to: 'entities#external_new'
  post 'external_entities', to: 'entities#external_create'
  # groups
  resources :groups, only: [:new, :create, :show] do
  resources :entities, only: [:new, :create, :show]
  end
 end
end
