Rails.application.routes.draw do

  resources :wikis
  resources :collaborators, only: [:create, :destroy]

  resources :charges, only: [:new, :create]

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/wikis'

  get 'charges/cancel' => 'charges#cancel', as: :cancel_premium
  post 'charges/cancel' => 'charges#destroy', as: :cancel_premium_post

  devise_for :users

  root 'welcome#index'

end
