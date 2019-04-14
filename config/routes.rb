Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, only: [:show, :edit, :update, :new, :create]
end
