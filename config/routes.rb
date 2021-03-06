Rails.application.routes.draw do
  devise_for :users
 root to: 'users#home'
 resources :users do 
  # external entites
  get 'external_entities', to: 'entities#external_new'
  post 'external_entities', to: 'entities#external_create'
  get 'all_entities', to: 'entities#index'
  # groups
  resources :groups, only: [:new, :create, :show, :index] do
    resources :entities, only: [:new, :create, :show] do 
    resources :recuring_entities, only: [:new, :create, :destroy], controller: 'rentities'
    end
  end
 end
end
