Rails.application.routes.draw do
  devise_for :members

  resources :posts, only: %i[new create index]

  root 'posts#index'
end
