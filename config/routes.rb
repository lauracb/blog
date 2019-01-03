Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments
  end
  
end
