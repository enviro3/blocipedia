Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
    post '/addcollaborator' => 'collaborators#create', as: :create
    post '/deletecollaborator' => 'collaborators#destroy', as: :destroy
  end

  resources :charges, only: [:new, :create]

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/wikis'

  get 'charges/cancel' => 'charges#cancel', as: :cancel_premium
  post 'charges/cancel' => 'charges#destroy', as: :cancel_premium_post

  devise_for :users

  root 'welcome#index'

end
