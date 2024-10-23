Rails.application.routes.draw do
  devise_for :users
  resources :stores do
    resources :ratings, only: [:create]
  end
  root 'stores#index'
end
