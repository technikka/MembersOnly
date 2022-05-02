Rails.application.routes.draw do
  devise_for :members

  resources :posts

  root 'posts#index'
end
