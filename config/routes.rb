Rails.application.routes.draw do
  devise_for :users
 root to: 'users#home'
 resources :users
 resources :groups, only: [:new, :create, :show]
 resources :entities, only: [:new, :create, :show]
end
